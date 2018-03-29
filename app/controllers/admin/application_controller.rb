class Admin::ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "admin_application"
  before_action :admin_check

  def admin_check
  	current_user.admin?
  end
end
