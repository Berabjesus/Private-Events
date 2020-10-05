class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :attended_event, through: :invites, class_name: 'Event', foreign_key: 'event_id'
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end

