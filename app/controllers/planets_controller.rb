class PlanetsController < ApplicationController
  before_action :set_planet, only: %i[show edit update destroy]
  before_action :check_owner, only: %i[edit update destroy]
  skip_before_action :authenticate_user!, only: :index

  # GET /planets or /planets.json
  def index
    @planets = Planet.all
  end

  # GET /planets/1 or /planets/1.json
  def show
    # necessary to access the booking form in the show
    @booking = Booking.new
    # capitalizes the planet.name header
    @planet.name = @planet.name.upcase
  end

  # GET /planets/new
  def new
    @planet = Planet.new
  end

  # GET /planets/1/edit
  def edit
  end

  # POST /planets or /planets.json
  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user # associate the planet with the current user

    respond_to do |format|
      if @planet.save
        flash[:notice] = "Planet was successfully created."
        format.html { redirect_to planets_url }
        format.json { render :index, status: :created, location: @planet }
      else
        flash.now[:alert] = @planet.errors.full_messages.to_sentence
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planets/1 or /planets/1.json
  def update
    respond_to do |format|
      if @planet.update(planet_params)
        flash[:notice] = "Planet was successfully updated."
        format.html { redirect_to planet_url(@planet) }
        format.json { render :show, status: :ok, location: @planet }
      else
        flash.now[:alert] = @planet.errors.full_messages.to_sentence
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planets/1 or /planets/1.json
  def destroy
    if @planet.bookings.where(status: ['pending', 'accepted']).exists?
      flash[:alert] = "Planet cannot be deleted because it has a pending or accepted booking."
      redirect_to @planet
    else
      @planet.destroy
      redirect_to planets_url, notice: "Planet was successfully destroyed."
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_planet
    @planet = Planet.find(params[:id])
  end

  def check_owner
    redirect_to(root_path, alert: 'Not authorized.') unless current_user == @planet.user
  end

  # Only allow a list of trusted parameters through.
  def planet_params
    params.require(:planet).permit(:name, :galaxy, :system, :description, :body_type, :price_per_night, :image)
  end
end
