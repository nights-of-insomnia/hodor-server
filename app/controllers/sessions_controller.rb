class SessionsController < ApplicationController
  before_action :redirect_if_authenticated

  def new
  end

  def create
    verify_credentials
  end

  private

  def verify_credentials
    correct_credentials? ? login_and_redirect : failed_credentials
  end

  def correct_credentials?
    params[:username] == 'testuser' && params[:password] == '123456'
  end

  def login_and_redirect
    create_session
    redirect_to successful_login_path, notice: t('.success')
  end

  def failed_credentials
    flash.alert = t('.failure')
    render :new
  end

  def create_session
    session[:username] = params[:username]
  end

  def redirect_if_authenticated
    if current_user
      redirect_to successful_login_path, notice: t('sessions.new.has_session')
    end
  end

end
