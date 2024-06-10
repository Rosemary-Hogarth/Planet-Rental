class Planet < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_galaxy_system_and_description,
                  against: %i[name galaxy system body_type description],
                  using: {
                    tsearch: { prefix: true }
                  }

  belongs_to :user

  validates :name, presence: true
  validates :galaxy, presence: true
  validates :system, presence: true
  validates :description, presence: true
  validates :body_type, presence: true
  validates :price_per_night, presence: true

  has_many :bookings, dependent: :destroy
  has_one_attached :image
end
