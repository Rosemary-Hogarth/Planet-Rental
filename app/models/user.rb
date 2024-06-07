class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, presence: true

  # A user has many bookings
  has_many :bookings, dependent: :destroy

  # A user has many booked planets through bookings
  has_many :planets, through: :bookings

  # A user has many owned planets
  has_many :owned_planets, class_name: 'Planet'
end
