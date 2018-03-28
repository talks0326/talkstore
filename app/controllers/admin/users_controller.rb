class Admin::UsersController < Admin::ApplicationController
  def index
  	@users = User.all
  end

  def show
  end

  def become
  	sign_in(:user, User.find(params[:id]), {bypass: true})
    redirect_to root_path
  end
end
