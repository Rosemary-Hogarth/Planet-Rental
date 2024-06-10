class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :planet

  validates :status, presence: true
  validates :date_in, presence: true
  validates :date_out, presence: true
end
