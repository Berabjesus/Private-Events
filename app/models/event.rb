class Event < ApplicationRecord
  validates :title, :description, :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :invites, dependent: :destroy
  has_many :attendees, through: :invites, class_name: 'User', foreign_key: :user_id

  def self.past
    self.where("date < now()").order('created_at DESc')
  end

  def self.upcoming
    self.where("date > now()").order('created_at DESc')
  end
end
