class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch bookings for current user who booked or owns planet
    @bookings = Booking.joins(:planet).where("bookings.user_id = ? OR planets.user_id = ?", current_user.id,
                                             current_user.id)
    # Fetch planets owned by current user
    @planets = current_user.planets.uniq
  end
end
