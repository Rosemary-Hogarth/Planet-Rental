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
        format.html { redirect_to planets_url, notice: "Planet was successfully created." }
        format.json { render :index, status: :created, location: @planet }
      else
        puts @planet.errors.full_messages
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /planets/1 or /planets/1.json
  def update
    respond_to do |format|
      if @planet.update(planet_params)
        format.html { redirect_to planet_url(@planet), notice: "Planet was successfully updated." }
        format.json { render :show, status: :ok, location: @planet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @planet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /planets/1 or /planets/1.json
  def destroy
    @planet.destroy!

    respond_to do |format|
      format.html { redirect_to planets_url, notice: "Planet was successfully destroyed." }
      format.json { head :no_content }
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
