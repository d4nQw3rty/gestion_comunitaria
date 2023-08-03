class CitiesController < ApplicationController
  before_action :set_city, only: %i[ show edit update destroy ]

  # GET /cities or /cities.json
  def index
    @user = current_user
    @state = State.find(params[:state_id])
    @cities = City.includes(:state).where(state_id: @state.id)
  end

  # GET /cities/1 or /cities/1.json
  def show
    @user = current_user
    @state = State.find(params[:state_id])
  end

  # GET /cities/new
  def new
    @user = current_user
    @city = City.new

  end

  # GET /cities/1/edit
  def edit
    @user = current_user
    
  end

  # POST /cities or /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to city_url(@city), notice: "City was successfully created." }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1 or /cities/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to state_url(@city.state), notice: "City was successfully updated." }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1 or /cities/1.json
  def destroy
    @city.destroy

    respond_to do |format|
      format.html { redirect_to cities_url, notice: "City was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def city_params
      params.require(:city).permit(:name, :state_id)
    end
end
