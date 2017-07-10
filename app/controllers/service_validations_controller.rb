class ServiceValidationsController < ApplicationController
  before_action :ensure_json_request
  before_action :verify_valid_params

  def show
    render json: { username: 'testuser' }
  end

  private

  def verify_valid_params
    head 422 unless required_params_set? &&
                    registered_service? &&
                    valid_ticket?
  end

  def registered_service?
    Services::Validation.registered?(params[:service])
  end

  def valid_ticket?
    params[:ticket] == '123'
  end

  def required_params_set?
    required_params.detect { |param| params[param].blank? }.nil?
  end

  def required_params
    %i[service ticket]
  end
end
