class ImportanceLevelsController < ApplicationController
  before_action :set_importance_level, only: [:show, :edit, :update, :destroy]

  # GET /importance_levels
  # GET /importance_levels.json
  def index
    @importance_levels = ImportanceLevel.all
  end

  # GET /importance_levels/1
  # GET /importance_levels/1.json
  def show
  end

  # GET /importance_levels/new
  def new
    @importance_level = ImportanceLevel.new
  end

  # GET /importance_levels/1/edit
  def edit
  end

  # POST /importance_levels
  # POST /importance_levels.json
  def create
    @importance_level = ImportanceLevel.new(importance_level_params)

    respond_to do |format|
      if @importance_level.save
        format.html { redirect_to @importance_level, notice: 'Importance level was successfully created.' }
        format.json { render :show, status: :created, location: @importance_level }
      else
        format.html { render :new }
        format.json { render json: @importance_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /importance_levels/1
  # PATCH/PUT /importance_levels/1.json
  def update
    respond_to do |format|
      if @importance_level.update(importance_level_params)
        format.html { redirect_to @importance_level, notice: 'Importance level was successfully updated.' }
        format.json { render :show, status: :ok, location: @importance_level }
      else
        format.html { render :edit }
        format.json { render json: @importance_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /importance_levels/1
  # DELETE /importance_levels/1.json
  def destroy
    @importance_level.destroy
    respond_to do |format|
      format.html { redirect_to importance_levels_url, notice: 'Importance level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_importance_level
      @importance_level = ImportanceLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def importance_level_params
      params.require(:importance_level).permit(:name)
    end
end
