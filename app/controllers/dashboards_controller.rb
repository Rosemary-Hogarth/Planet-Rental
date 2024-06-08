class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch bookings for current user who booked or owns planet
    @bookings = Booking.joins(:planet).where("bookings.user_id = ? OR planets.user_id = ?", current_user.id,
                                             current_user.id).order(created_at: :desc)
    # Fetch planets owned by current user and sort by creation date
    @planets = current_user.owned_planets.order(created_at: :desc).uniq
  end
end
