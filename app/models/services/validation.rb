# Verify if given service URL is allowed by Hodor-Server
# Services::Validation delegates registered? to a validator.
# To change desired validator:
# Services::Validation.registered?(service, CustomValidatorClass)
module Services
  module Validation
    def self.registered?(service_url, validator=Validator.new)
      validator.registered?(service_url)
    end
  end
end
