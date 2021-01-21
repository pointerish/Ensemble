class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_and_belongs_to_many :attended_events, class_name: 'Event'

  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/.freeze
  validates :username, presence: true, length: { maximum: 20, minimum: 5 }, format: { with: VALID_USERNAME_REGEX },
                       uniqueness: { case_sensitive: false }
end
