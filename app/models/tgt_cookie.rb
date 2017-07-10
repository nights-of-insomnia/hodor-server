class TGTCookie < ApplicationRecord
  validates :cookie, presence: true
  validates :username, presence: true

  scope :by_cookie, ->(cookie) { where(cookie: cookie) }
  scope :created_after, ->(time) { where('created_at >= ?', time.to_s(:db)) }
end
