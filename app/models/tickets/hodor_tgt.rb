# Generates and validates ticket granting tickets
module Tickets
  module HodorTGT
    COOKIE_DURATION = 20.minutes
    # Generates a new ticket granting ticket (TGT)
    # delegates generate_ticket to Generators::TGTGenerator
    # To change desired ticket generator:
    # Tickets::HodorTGT.generate_ticket(CustomGeneratorClass)
    def self.generate_ticket(username, generator = Generators::TGTGenerator.new)
      cookie_hash_for generator.generate_ticket(username)
    end

    # Validates a given ticket granting ticket (TGT)
    # delegates validate_ticket to Validators::TGTValidator
    # To change desired ticket validator:
    # Tickets::HodorTGT.validate_ticket(CustomValidatorClass)
    def self.validate_ticket(ticket, validator = Validators::TGTValidator.new)
      validator.validate_ticket(ticket, COOKIE_DURATION.ago)
    end

    def self.cookie_hash_for(ticket)
      { value: ticket, expires: COOKIE_DURATION.from_now }
    end
  end
end
