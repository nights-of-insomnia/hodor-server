class SessionsController < ApplicationController
  skip_before_action :login_required
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
    params[:username] == 'testuser' && params[:password] == '123456'
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
    redirect_to_home(t('sessions.new.has_session')) if current_user
  end

  def set_cookie
    cookies.signed[:CASTGT] = generate_cookie
  end

  def generate_cookie
    # persist cookie
    { value: 'TGT-123456', expires: 20.minutes.from_now }
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

end
