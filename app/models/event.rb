class Event < ApplicationRecord
  validates :title, :description, :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, class_name: 'User', foreign_key: :user_id

  scope :past, -> { where('date < now()').order('created_at DESc') }
  scope :upcoming, -> { where('date > now()').order('created_at DESc') }
end
