class DataGroupsController < ApplicationController
  before_action :set_data_group, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :own_data_group, only: [:show, :edit, :update, :destroy]
  
  # GET /data_groups
  # GET /data_groups.json
  def index
    @data_groups = DataGroup.where(user_id: current_user.id)
  end

  # GET /data_groups/1
  # GET /data_groups/1.json
  def show
    unless current_user.id == @data_group.user_id
      redirect_to(root_path, notice: "You cannot access that data") and return
    end
    @measurement_data = MeasurementDatum.where(data_group_id: params[:id]).order(:graph_time)
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
        format.html { redirect_to input_path, notice: 'You can now input data for ' + @data_group.name + ' (' + @data_group.unit + ')' }
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
        format.html { redirect_to @data_group, notice: @data_group.name + ' (' + @data_group.unit+ ') was successfully updated' }
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

  def input
    @data_groups = DataGroup.where(user_id: current_user.id).includes(:measurement_data)
    @has_data = false
    @data_groups.each do |data_group|
      @has_data = @has_data || data_group.measurement_data.any?
    end
    unless @data_groups.any?
      redirect_to new_data_group_path
    end
  end

  def save_input
    puts params.inspect
    puts params[:measurement]
    params.each do |param|
      puts param
    end

    notice = ''
    saved_data = []

    params[:measurement].each do |measurement|
      if measurement[1] != ''
        if DataGroup.find(measurement[0])
          @data_group = DataGroup.find(measurement[0])
          if own_data_group
            measurement_datum = @data_group.measurement_data.create(value: measurement[1])
            if measurement_datum.save
              saved_data.push(@data_group.name + ': ' + measurement[1])
            end
          end 
        end
      end
    end
    if saved_data.size > 0
      notice = 'Data saved: ' + saved_data.join(', ') 
    end
    redirect_to input_path,  notice: notice
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

    

    def own_data_group
      unless current_user.id == @data_group.user_id
        redirect_to(root_path, notice: "You cannot access that data") and return
      end
      return true
    end
end
