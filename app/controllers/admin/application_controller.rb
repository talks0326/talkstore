class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin_application"
  before_action :admin_check

  def admin_check
  	unless current_user.admin?
  		redirect_to root_path
  	end
  end
end
