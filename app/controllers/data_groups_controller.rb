class DataGroupsController < ApplicationController
  before_action :set_data_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /data_groups
  # GET /data_groups.json
  def index
    
    @data_groups = DataGroup.where(user_id: current_user.id)
  end

  # GET /data_groups/1
  # GET /data_groups/1.json
  def show
    if data_group.user_id != current_user.id
      redirect_to root_path
    end
    @measurement_data = MeasurementDatum.where(data_group_id: params[:id])
  end

  # GET /data_groups/new
  def new
    @data_group = DataGroup.new
  end

  # GET /data_groups/1/edit
  def edit
  end

  # POST /data_groups
  # POST /data_groups.json
  def create
    @data_group = current_user.data_groups.new(data_group_params)

    respond_to do |format|
      if @data_group.save
        format.html { redirect_to @data_group, notice: 'Data group was successfully created.' }
        format.json { render :show, status: :created, location: @data_group }
      else
        format.html { render :new }
        format.json { render json: @data_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_groups/1
  # PATCH/PUT /data_groups/1.json
  def update
    respond_to do |format|
      if @data_group.update(data_group_params)
        format.html { redirect_to @data_group, notice: 'Data group was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_group }
      else
        format.html { render :edit }
        format.json { render json: @data_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_groups/1
  # DELETE /data_groups/1.json
  def destroy
    @data_group.destroy
    respond_to do |format|
      format.html { redirect_to data_groups_url, notice: 'Data group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_group
      @data_group = DataGroup.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def data_group_params
      params.require(:data_group).permit(:name, :unit)
    end
end
