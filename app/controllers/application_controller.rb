class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def successful_login_path
    home_path
  end
end
