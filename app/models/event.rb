# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title, :description, :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: :user_id
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, class_name: 'User', foreign_key: :user_id

  scope :past, -> { where('date < now()').order('created_at DESc') }
  scope :upcoming, -> { where('date > now()').order('created_at DESc') }

  # def self.past
  #   self.where("date < now()").order('created_at DESc')
  # end

  # def self.upcoming
  #   self.where("date > now()").order('created_at DESc')
  # end
end
