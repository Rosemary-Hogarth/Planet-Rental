class Planet < ApplicationRecord
  validates :name, presence: true
  validates :galaxy, presence: true
  validates :system, presence: true
  validates :description, presence: true
  validates :price_per_night, presence: true

  has_many :bookings, dependent: :destroy
end
