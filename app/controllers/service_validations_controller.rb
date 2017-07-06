class ServiceValidationsController < ApplicationController
  before_action :ensure_json_request
  before_action :verify_params
  before_action :verify_registered_service
  before_action :verify_valid_ticket

  def show
    render json: { username: 'testuser' }
  end

  private

  def verify_params
    head 422 unless required_params_set?
  end

  # change
  def verify_registered_service
    head 422 unless params[:service] == 'www.example.com'
  end

  def verify_valid_ticket
    head 422 unless params[:ticket] == '123'
  end

  def required_params_set?
    required_params.detect {|param| params[param].blank? }.nil?
  end

  def required_params
    [:service, :ticket]
  end

end
