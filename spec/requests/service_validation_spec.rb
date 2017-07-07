require 'rails_helper'

describe 'Service validation', type: :request do
  it 'non json request is not accepted' do
    get '/service_validation.html',
        params: { service: 'www.example.com', ticket: '123' }
    expect(response).to have_http_status(406)
  end

  it 'hitting the endpoint without service param' do
    get '/service_validation.json',
        params: { ticket: '123' }
    expect(response).to have_http_status(422)
  end

  it 'hitting the endpoint without ticket param' do
    get '/service_validation.json',
        params: { service: 'www.example.com' }
    expect(response).to have_http_status(422)
  end

  it 'hitting the endpoint with unregistered service' do
    get '/service_validation.json',
        params: { service: 'www.barbie.com', ticket: '123' }
    expect(response).to have_http_status(422)
  end

  it 'hitting the endpoint with unregistered ticket' do
    get '/service_validation.json',
        params: { service: 'www.example.com', ticket: '999' }
    expect(response).to have_http_status(422)
  end

  it 'hitting the endpoint with correct service and ticket' do
    get '/service_validation.json',
        params: { service: 'www.example.com', ticket: '123' }
    expect(response).to have_http_status(200)
    expect(json_parsed_response['username']).to eql 'testuser'
  end

  it 'hitting the endpoint with expired ticket' do
    get '/service_validation.json',
        params: { service: 'www.example.com', ticket: '123' }
    expect(response).to have_http_status(200)
  end

  it 'hitting the endpoint with consumed ticket'
end
