class ApplicationController < ActionController::Base
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

  def ensure_json_request
    head 406 unless request.format == :json
  end

end
