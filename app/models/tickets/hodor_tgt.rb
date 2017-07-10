# Generates a new ticket granting ticket (TGT)
# Tickets::HodorTGT delegates generate_ticket to TGTGenerator.
# To change desired ticket generator:
# Tickets::HodorTGT.generate_ticket(CustomGeneratorClass)
module Tickets
  module HodorTGT
    def self.generate_ticket(username, generator = TGTGenerator.new)
      generator.generate_ticket(username)
    end
  end
end
