class DatasetScopesController < ApplicationController
  before_action :set_dataset_scope, only: [:show, :edit, :update, :destroy]

  # GET /dataset_scopes
  # GET /dataset_scopes.json
  def index
    @dataset_scopes = DatasetScope.all
  end

  # GET /dataset_scopes/1
  # GET /dataset_scopes/1.json
  def show
  end

  # GET /dataset_scopes/new
  def new
    @dataset_scope = DatasetScope.new
  end

  # GET /dataset_scopes/1/edit
  def edit
  end

  # POST /dataset_scopes
  # POST /dataset_scopes.json
  def create
    @dataset_scope = DatasetScope.new(dataset_scope_params)

    respond_to do |format|
      if @dataset_scope.save
        format.html { redirect_to @dataset_scope, notice: 'Dataset scope was successfully created.' }
        format.json { render :show, status: :created, location: @dataset_scope }
      else
        format.html { render :new }
        format.json { render json: @dataset_scope.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dataset_scopes/1
  # PATCH/PUT /dataset_scopes/1.json
  def update
    respond_to do |format|
      if @dataset_scope.update(dataset_scope_params)
        format.html { redirect_to @dataset_scope, notice: 'Dataset scope was successfully updated.' }
        format.json { render :show, status: :ok, location: @dataset_scope }
      else
        format.html { render :edit }
        format.json { render json: @dataset_scope.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dataset_scopes/1
  # DELETE /dataset_scopes/1.json
  def destroy
    @dataset_scope.destroy
    respond_to do |format|
      format.html { redirect_to dataset_scopes_url, notice: 'Dataset scope was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dataset_scope
      @dataset_scope = DatasetScope.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dataset_scope_params
      params.require(:dataset_scope).permit(:name)
    end
end
