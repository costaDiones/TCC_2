class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]


  # GET /readings
  # GET /readings.json
  def index
    if params[:search]
        @readings = Reading.where( month_reference: params[:search])
    else
      @readings = []
      Reading.all.each do |reading|

        if reading.hydrometer.user.id == current_user.id or current_user.admin?
            @readings << reading
        end

      end
    end
  end






  # GET /readings/1
  # GET /readings/1.json
  def show

  end

  # GET /readings/new
  def new
    @reading = Reading.new
    authorize @reading

  end

  # GET /readings/1/edit
  def edit
    @reading = Reading.find(params[:id])
    authorize @reading

  end

  # POST /readings
  # POST /readings.json
  def create
    @reading = Reading.new(reading_params)


    @readings_for_user1 = []

    Reading.all.each do |reading|
      if reading.hydrometer.user.id == @reading.hydrometer.user_id
          @readings_for_user1 << reading
      end
    end

    @readings_for_user1.each do |reading|
      ultimo = @readings_for_user1.last
      valor = @reading.reading - ultimo.reading
      @reading.consumption = valor * 1000

    end
    if @reading.consumption == nil
      @reading.consumption = @reading.reading * 1000
    end


    if @reading.consumption > 10000
      valorNormal = @reading.prince.valueAbove
      consumoAcima = @reading.consumption - 10000
      valorAcima = valorNormal * consumoAcima
      @reading.invoiceValue  = valorAcima + @reading.prince.valueNormal

    else
      @reading.invoiceValue  =  @reading.prince.valueNormal

      end

  if @reading.paid == nil
       @reading.paid = "Nao Pago"


  end


    respond_to do |format|
      if @reading.save
        format.html { redirect_to @reading, notice: 'Reading was successfully created.' }
        format.json { render :show, status: :created, location: @reading }
      else
        format.html { render :new }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update



      @reading.update(reading_params)

      if @reading.consumption > 10000
        valorNormal = @reading.prince.valueAbove
        consumoAcima = @reading.consumption - 10000
        valorAcima = valorNormal * consumoAcima
        @reading.invoiceValue  = valorAcima + @reading.prince.valueNormal




      else
        @reading.invoiceValue  =  @reading.prince.valueNormal

      end



      respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to @reading, notice: 'Reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading }
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy
    @users = Reading.find(params[:id])
    authorize @users
    @reading.destroy
    respond_to do |format|
      format.html { redirect_to readings_url, notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @reading = Reading.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:date_reading, :reading, :consumption, :month_reference, :invoiceValue, :paid, :hydrometer_id, :prince_id)
    end
end
