# Verify if passed login params are valid
# Credentials::Checker delegates valid? to a validator.
# To change desired validator:
# Credentials::Checker.valid?(params, CustomValidatorClass)
module Credentials
  module Checker
    def self.valid?(attributes, validator=Validators::Base.new)
      validator.valid?(attributes)
    end
  end
end
