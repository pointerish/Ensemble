class User < ApplicationRecord
  has_many :events, through: :attendants
  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
