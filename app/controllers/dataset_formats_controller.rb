class DatasetFormatsController < ApplicationController
  before_action :set_dataset_format, only: [:show, :edit, :update, :destroy]

  # GET /dataset_formats
  # GET /dataset_formats.json
  def index
    @dataset_formats = DatasetFormat.all
  end

  # GET /dataset_formats/1
  # GET /dataset_formats/1.json
  def show
  end

  # GET /dataset_formats/new
  def new
    @dataset_format = DatasetFormat.new
  end

  # GET /dataset_formats/1/edit
  def edit
  end

  # POST /dataset_formats
  # POST /dataset_formats.json
  def create
    @dataset_format = DatasetFormat.new(dataset_format_params)

    respond_to do |format|
      if @dataset_format.save
        format.html { redirect_to @dataset_format, notice: 'Dataset format was successfully created.' }
        format.json { render :show, status: :created, location: @dataset_format }
      else
        format.html { render :new }
        format.json { render json: @dataset_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_formats/1
  # PATCH/PUT /dataset_formats/1.json
  def update
    respond_to do |format|
      if @dataset_format.update(dataset_format_params)
        format.html { redirect_to @dataset_format, notice: 'Dataset format was successfully updated.' }
        format.json { render :show, status: :ok, location: @dataset_format }
      else
        format.html { render :edit }
        format.json { render json: @dataset_format.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_formats/1
  # DELETE /dataset_formats/1.json
  def destroy
    @dataset_format.destroy
    respond_to do |format|
      format.html { redirect_to dataset_formats_url, notice: 'Dataset format was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_format
      @dataset_format = DatasetFormat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_format_params
      params.require(:dataset_format).permit(:name)
    end
end
