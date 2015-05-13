class UseLevelsController < ApplicationController
  before_action :set_use_level, only: [:show, :edit, :update, :destroy]

  # GET /use_levels
  # GET /use_levels.json
  def index
    @use_levels = UseLevel.all
  end

  # GET /use_levels/1
  # GET /use_levels/1.json
  def show
  end

  # GET /use_levels/new
  def new
    @use_level = UseLevel.new
  end

  # GET /use_levels/1/edit
  def edit
  end

  # POST /use_levels
  # POST /use_levels.json
  def create
    @use_level = UseLevel.new(use_level_params)

    respond_to do |format|
      if @use_level.save
        format.html { redirect_to @use_level, notice: 'Use level was successfully created.' }
        format.json { render :show, status: :created, location: @use_level }
      else
        format.html { render :new }
        format.json { render json: @use_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /use_levels/1
  # PATCH/PUT /use_levels/1.json
  def update
    respond_to do |format|
      if @use_level.update(use_level_params)
        format.html { redirect_to @use_level, notice: 'Use level was successfully updated.' }
        format.json { render :show, status: :ok, location: @use_level }
      else
        format.html { render :edit }
        format.json { render json: @use_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /use_levels/1
  # DELETE /use_levels/1.json
  def destroy
    @use_level.destroy
    respond_to do |format|
      format.html { redirect_to use_levels_url, notice: 'Use level was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_use_level
      @use_level = UseLevel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def use_level_params
      params.require(:use_level).permit(:name)
    end
end
