class Service < ApplicationRecord
  has_many :service_urls

  validates :name, presence: true
end
