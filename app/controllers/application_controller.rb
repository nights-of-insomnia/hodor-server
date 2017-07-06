class ApplicationController < ActionController::Base
  before_action :login_required
  protect_from_forgery with: :exception

  def current_user
    session[:username]
  end

  def successful_login_path
    home_path
  end

  private

  def login_required
    redirect_to login_path unless current_user
  end

end
