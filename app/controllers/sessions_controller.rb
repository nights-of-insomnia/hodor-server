class SessionsController < ApplicationController

  def new
  end

  def create
    redirect_to home_path, notice: t('.success') if correct_credentials?
  end

  private

  def correct_credentials?
    params[:username] == 'testuser' && params[:password] == '123456'
  end

end
