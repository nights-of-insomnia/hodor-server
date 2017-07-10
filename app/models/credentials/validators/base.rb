# Validates user credentials by checking it against the database
module Credentials
  module Validators
    class Base
      # if user found => true
      # if user not found => false
      def valid?(attributes)
        User
          .find_by(username: attributes[:username])
          .try(:authenticate, attributes[:password])
          .present?
      end
    end
  end
end
