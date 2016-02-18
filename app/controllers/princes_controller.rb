class PrincesController < ApplicationController
  before_action :set_prince, only: [:show, :edit, :update, :destroy]

  # GET /princes
  # GET /princes.json
  def index

    @princes = Prince.all


  end

  # GET /princes/1
  # GET /princes/1.json
  def show
  end

  # GET /princes/new
  def new

    @prince = Prince.new
    authorize @prince
  end

  # GET /princes/1/edit
  def edit
    @prince = Prince.find(params[:id])
    authorize @prince

  end

  # POST /princes
  # POST /princes.json
  def create
    @prince = Prince.new(prince_params)

    respond_to do |format|
      if @prince.save
        format.html { redirect_to @prince, notice: 'Prince was successfully created.' }
        format.json { render :show, status: :created, location: @prince }
      else
        format.html { render :new }
        format.json { render json: @prince.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /princes/1
  # PATCH/PUT /princes/1.json
  def update

    respond_to do |format|
      if @prince.update(prince_params)
        format.html { redirect_to @prince, notice: 'Prince was successfully updated.' }
        format.json { render :show, status: :ok, location: @prince }
      else
        format.html { render :edit }
        format.json { render json: @prince.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /princes/1
  # DELETE /princes/1.json
  def destroy

    @users = Prince.find(params[:id])
    authorize @users

    @prince.destroy
    respond_to do |format|
      format.html { redirect_to princes_url, notice: 'Prince was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prince
      @prince = Prince.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prince_params
      params.require(:prince).permit(:valueNormal, :valueAbove, :datePrince)
    end
end
