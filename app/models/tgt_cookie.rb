class TGTCookie < ApplicationRecord
  validates :cookie, presence: true
  validates :username, presence: true
end
