class User < ApplicationRecord
  has_many :events, through: :attendants
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\z/
  validates :username, presence: true, length: { maximum: 20, minimum: 5 }, format: { with: VALID_USERNAME_REGEX }, uniqueness: { case_sensitive: false }
end
