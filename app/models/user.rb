class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_many :events, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :attended_events, class_name: 'Event', foreign_key: 'event_id', through: :attendances
end
