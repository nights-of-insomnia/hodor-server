module JsonParseHelper
  def json_parsed_response
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include JsonParseHelper, type: :request
end
