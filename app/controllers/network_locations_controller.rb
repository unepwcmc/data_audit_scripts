class NetworkLocationsController < ApplicationController
  before_action :set_network_location, only: [:show, :edit, :update, :destroy]

  # GET /network_locations
  # GET /network_locations.json
  def index
    @network_locations = NetworkLocation.all
  end

  # GET /network_locations/1
  # GET /network_locations/1.json
  def show
  end

  # GET /network_locations/new
  def new
    @network_location = NetworkLocation.new
  end

  # GET /network_locations/1/edit
  def edit
  end

  # POST /network_locations
  # POST /network_locations.json
  def create
    @network_location = NetworkLocation.new(network_location_params)

    respond_to do |format|
      if @network_location.save
        format.html { redirect_to @network_location, notice: 'Network location was successfully created.' }
        format.json { render :show, status: :created, location: @network_location }
      else
        format.html { render :new }
        format.json { render json: @network_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /network_locations/1
  # PATCH/PUT /network_locations/1.json
  def update
    respond_to do |format|
      if @network_location.update(network_location_params)
        format.html { redirect_to @network_location, notice: 'Network location was successfully updated.' }
        format.json { render :show, status: :ok, location: @network_location }
      else
        format.html { render :edit }
        format.json { render json: @network_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_locations/1
  # DELETE /network_locations/1.json
  def destroy
    @network_location.destroy
    respond_to do |format|
      format.html { redirect_to network_locations_url, notice: 'Network location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_network_location
      @network_location = NetworkLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def network_location_params
      params.require(:network_location).permit(:path, :drive_id)
    end
end
