class ServiceUrl < ApplicationRecord
  belongs_to :service

  validates :url, presence: true

  scope :by_url, ->(url) { where(url: url) }
end
