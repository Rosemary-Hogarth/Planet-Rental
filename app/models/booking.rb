class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  validates :status, presence: true
end
