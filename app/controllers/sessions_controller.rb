class SessionsController < ApplicationController
  before_action :redirect_if_authenticated

  def new
    set_service_session
  end

  def create
    verify_credentials
  end

  private

  def set_service_session
    session[:service] = params[:service]
  end

  def verify_credentials
    correct_credentials? ? login_and_redirect : failed_credentials
  end

  def correct_credentials?
    Credentials::Checker.valid?(user_params)
  end

  def login_and_redirect
    create_session
    set_cookie
    successful_redirect
  end

  def failed_credentials
    flash.alert = t('.failure')
    render :new
  end

  def create_session
    session[:username] = params[:username]
  end

  def redirect_if_authenticated
    redirect_to_home(t('sessions.new.has_session')) if valid_cookie_set?
  end

  def set_cookie
    cookies.signed[:CASTGT] = generate_tgt
  end

  def generate_tgt
    Tickets::HodorTGT.generate_ticket(session[:username])
  end

  def successful_redirect
    service ? redirect_with_ticket : redirect_to_home
  end

  def service
    session[:service]
  end

  def redirect_with_ticket
    redirect_to service_redirect_path
  end

  def redirect_to_home(notice=nil)
    notice ||= t('.success')
    redirect_to successful_login_path, notice: notice
  end

  def service_redirect_path
    callback = Addressable::URI.parse(service)
    callback.query_values = ticket_hash
    callback.to_s
  end

  def ticket_hash
    # persist ticket
    { ticket: 'ST-1234' }
  end

  def user_params
    params.permit(:username, :password)
  end
end
