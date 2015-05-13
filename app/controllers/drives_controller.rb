class DrivesController < ApplicationController
  before_action :set_drife, only: [:show, :edit, :update, :destroy]

  # GET /drives
  # GET /drives.json
  def index
    @drives = Drive.all
  end

  # GET /drives/1
  # GET /drives/1.json
  def show
  end

  # GET /drives/new
  def new
    @drife = Drive.new
  end

  # GET /drives/1/edit
  def edit
  end

  # POST /drives
  # POST /drives.json
  def create
    @drife = Drive.new(drife_params)

    respond_to do |format|
      if @drife.save
        format.html { redirect_to @drife, notice: 'Drive was successfully created.' }
        format.json { render :show, status: :created, location: @drife }
      else
        format.html { render :new }
        format.json { render json: @drife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drives/1
  # PATCH/PUT /drives/1.json
  def update
    respond_to do |format|
      if @drife.update(drife_params)
        format.html { redirect_to @drife, notice: 'Drive was successfully updated.' }
        format.json { render :show, status: :ok, location: @drife }
      else
        format.html { render :edit }
        format.json { render json: @drife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drives/1
  # DELETE /drives/1.json
  def destroy
    @drife.destroy
    respond_to do |format|
      format.html { redirect_to drives_url, notice: 'Drive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drife
      @drife = Drive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drife_params
      params.require(:drife).permit(:name)
    end
end
