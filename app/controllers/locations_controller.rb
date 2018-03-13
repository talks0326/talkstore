class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket
  def show
  end

  def check_in
  	@latitude = params[:latitude]
  	@longitude = params[:longitude]
  	locale = current_user.locales.build
  	locale.latitude = @latitude
  	locale.longitude = @longitude
  	locale.save

  	if @ticket.user_id == current_user.id
  		target_user = @ticket.offer.user
  		target_locale = @ticket.offer.user.locales.last
  	else
  		target_user = @ticket.user
  		target_locale = @ticket.user.locales.last
  	end
  	unless target_locale.blank?
  		if distance(locale.latitude,locale.longitude,target_locale.latitude,target_locale.longitude) < 0.1
  			current_user.user_tries.last.state_machine.transition_to(:matching)
  			target_user.user_tries.last.state_machine.transition_to(:matching)
  		end
  	end
  	redirect_to root_path
  end	

  def current
  	@latitude = params[:lat]
  	@longitude = params[:lon]
  	locale = current_user.locales.build
  	locale.latitude = @latitude
  	locale.longitude = @longitude
  	locale.save
  end

  def checked_in
    current_user.user_tries.last.state_machine.transition_to(:matching)

    redirect_to root_path
  end

  private
  def set_ticket
    @ticket = Ticket.find(params[:id])  
  end

  def distance(lat1, lng1, lat2, lng2)
	  # ラジアン単位に変換
	  x1 = lat1.to_f * Math::PI / 180
	  y1 = lng1.to_f * Math::PI / 180
	  x2 = lat2.to_f * Math::PI / 180
	  y2 = lng2.to_f * Math::PI / 180
	  
	  # 地球の半径 (km)
	  radius = 6378.137
	  
	  # 差の絶対値
	  diff_y = (y1 - y2).abs
	  
	  calc1 = Math.cos(x2) * Math.sin(diff_y)
	  calc2 = Math.cos(x1) * Math.sin(x2) - Math.sin(x1) * Math.cos(x2) * Math.cos(diff_y)
	  
	  # 分子
	  numerator = Math.sqrt(calc1 ** 2 + calc2 ** 2)
	  
	  # 分母
	  denominator = Math.sin(x1) * Math.sin(x2) + Math.cos(x1) * Math.cos(x2) * Math.cos(diff_y)
	  
	  # 弧度
	  degree = Math.atan2(numerator, denominator)
	  
	  # 大円距離 (km)
	  degree * radius
	end
end
