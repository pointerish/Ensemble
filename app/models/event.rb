# rubocop:disable Naming/AccessorMethodName

class Event < ApplicationRecord
  include SessionsHelper

  has_many :attendants
  validates :name, presence: true, length: { minimum: 5 }
  validates :location, presence: true, length: { minimum: 5, maximum: 50 }
  validates :date, presence: true
  validates :created_by, presence: true

  scope :upcoming, -> { where('date >= ?', Time.zone.now) }
  scope :previous, -> { where('date < ?', Time.zone.now) }

  def set_user!(user)
    self.created_by = user.id
    save!
  end
end

# rubocop:enable Naming/AccessorMethodName
