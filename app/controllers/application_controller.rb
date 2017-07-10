class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def login_required
    redirect_to login_path unless valid_cookie_set?
  end

  def cas_cookie
    cookies.signed[:CASTGT]
  end

  def cas_cookie_valid?
    Tickets::HodorTGT.validate_ticket(cas_cookie)
  end

  def valid_cookie_set?
    cas_cookie && cas_cookie_valid?
  end

  def ensure_json_request
    head 406 unless request.format == :json
  end

  def successful_login_path
    home_path
  end
end
