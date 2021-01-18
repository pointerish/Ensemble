class Attendant < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :my_events, ->(user_identifier) { where('user_id = ?', user_identifier) }
end
