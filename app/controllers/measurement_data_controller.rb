class MeasurementDataController < ApplicationController
  before_action :set_measurement_datum, only: [:show, :edit, :update, :destroy]

  # GET /measurement_data
  # GET /measurement_data.json
  def index
    @measurement_data = MeasurementDatum.all
  end

  # GET /measurement_data/1
  # GET /measurement_data/1.json
  def show
  end

  # GET /measurement_data/new
  def new
    @measurement_datum = MeasurementDatum.new
  end

  # GET /measurement_data/1/edit
  def edit
  end

  # POST /measurement_data
  # POST /measurement_data.json
  def create
    @measurement_datum = MeasurementDatum.new(measurement_datum_params)

    respond_to do |format|
      if @measurement_datum.save
        @measurement_datum.graph_time = @measurement_datum.created_at
        @measurement_datum.save
        format.html { redirect_to @measurement_datum, notice: 'Measurement datum was successfully created.' }
        format.json { render :show, status: :created, location: @measurement_datum }
      else
        format.html { render :new }
        format.json { render json: @measurement_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measurement_data/1
  # PATCH/PUT /measurement_data/1.json
  def update
    respond_to do |format|
      if @measurement_datum.update(measurement_datum_params)
        format.html { redirect_to @measurement_datum, notice: 'Measurement datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @measurement_datum }
      else
        format.html { render :edit }
        format.json { render json: @measurement_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measurement_data/1
  # DELETE /measurement_data/1.json
  def destroy
    @measurement_datum.destroy
    respond_to do |format|
      format.html { redirect_to measurement_data_url, notice: 'Measurement datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measurement_datum
      @measurement_datum = MeasurementDatum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def measurement_datum_params
      params.require(:measurement_datum).permit(:value, :graph_time)
    end
end
