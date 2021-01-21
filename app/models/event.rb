class Event < ApplicationRecord
  include SessionsHelper

  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :attendees, class_name: "User"
  validates :name, presence: true, length: { minimum: 5 }
  validates :location, presence: true, length: { minimum: 5, maximum: 50 }
  validates :date, presence: true

  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :previous, -> { where('date < ?', Time.zone.now) }
end
