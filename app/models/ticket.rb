class Ticket < ApplicationRecord

  belongs_to :service

  validates :ticket, presence: true

end
