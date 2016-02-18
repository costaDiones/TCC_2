class HydrometersController < ApplicationController
  before_action :set_hydrometer, only: [:show, :edit, :update, :destroy]

  # GET /hydrometers
  # GET /hydrometers.json
  def index
      if params[:search]
          @hydrometers = Hydrometer.where(id: params[:search])
      else
        @users = User.all
        authorize @users
        @hydrometers = Hydrometer.all
    end

  end

  # GET /hydrometers/1
  # GET /hydrometers/1.json
  def show

  end

  # GET /hydrometers/new
  def new

    @hydrometer = Hydrometer.new


  end

  # GET /hydrometers/1/edit
  def edit
    

  end

  # POST /hydrometers
  # POST /hydrometers.json
  def create



    @hydrometer = Hydrometer.new(hydrometer_params)

    respond_to do |format|
      if @hydrometer.save
        format.html { redirect_to @hydrometer, notice: 'Hydrometer was successfully created.' }
        format.json { render :show, status: :created, location: @hydrometer }
      else
        format.html { render :new }
        format.json { render json: @hydrometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hydrometers/1
  # PATCH/PUT /hydrometers/1.json
  def update

    respond_to do |format|
      if @hydrometer.update(hydrometer_params)
        format.html { redirect_to @hydrometer, notice: 'Hydrometer was successfully updated.' }
        format.json { render :show, status: :ok, location: @hydrometer }
      else
        format.html { render :edit }
        format.json { render json: @hydrometer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hydrometers/1
  # DELETE /hydrometers/1.json
  def destroy
    @hydrometer.destroy
    respond_to do |format|
      format.html { redirect_to hydrometers_url, notice: 'Hydrometer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hydrometer
      @hydrometer = Hydrometer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hydrometer_params
      params.require(:hydrometer).permit(:user_id)
    end
end
