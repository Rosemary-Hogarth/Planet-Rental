class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_planet, only: %i[new create accept reject]
  before_action :set_booking, only: %i[accept reject]

  def new
    @booking = @planet.bookings.build
  end

  def create
    @booking = @planet.bookings.build(booking_params.merge(user: current_user, status: 'pending'))
    if @booking.save
      # If booking is successfull, save & redirect user to the booking's show page
      redirect_to planet_booking_path(@planet, @booking), notice: 'Booking request sent.'
    else
      # render the new booking form again.
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @planet = @booking.planet
    # If current user made booking or owns planet, allow them to view the booking
    return if current_user == @booking.user || current_user == @planet.user

    # If current user is neither, redirect them with an alert
    redirect_to dashboard_path, alert: 'Not authorized.'
  end

  def accept
    @booking = Booking.find(params[:id])
    # If current user is planet owner, allow them to accept the booking
    if @booking.planet.user == current_user
      # Update booking status to 'accepted'
      @booking.update(status: 'accepted')
      # Redirect user with a success notice
      redirect_to dashboard_path, notice: 'Booking accepted.'
    else
      # If current user is not planet owner, redirect them with an alert
      redirect_to dashboard_path, alert: 'Not authorized.'
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    # If current user is planet owner, allow them to reject the booking
    if @booking.planet.user == current_user
      # Update booking status to 'rejected'
      @booking.update(status: 'rejected')
      # Redirect user with a success notice
      redirect_to dashboard_path, notice: 'Booking rejected.'
    else
      # If current user is not planet owner, redirect them with an alert
      redirect_to dashboard_path, alert: 'Not authorized.'
    end
  end

  private

  def set_planet
    @planet = Planet.find(params[:planet_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:planet_id, :date_in, :date_out, :status)
  end
end
