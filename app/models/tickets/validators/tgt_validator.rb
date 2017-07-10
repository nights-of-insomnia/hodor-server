# Validates a TGT by checking it against the database
# Ticket and username must be an EXACT match
# Returns true if ticket and username found within allowed period
# Returns false if ticket and username WITHIN allowed period not found
module Tickets
  module Validators
    class TGTValidator
      def validate_ticket(ticket, min_period_allowed)
        TGTCookie
          .by_cookie(ticket)
          .created_after(min_period_allowed)
          .any?
      end
    end
  end
end
