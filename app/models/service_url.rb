class ServiceUrl < ApplicationRecord

  belongs_to :service
  
  validates :url, presence: true

end
