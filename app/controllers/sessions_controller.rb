class SessionsController < ApplicationController

  def new
  end

  def create
    verify_credentials
  end

  private

  def verify_credentials
    if correct_credentials?
      redirect_to successful_login_path, notice: t('.success')
    else
      flash.alert = t('.failure')
      render :new
    end
  end

  def correct_credentials?
    params[:username] == 'testuser' && params[:password] == '123456'
  end

end
