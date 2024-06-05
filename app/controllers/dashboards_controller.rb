class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
    @planets = current_user.planets
  end
end
