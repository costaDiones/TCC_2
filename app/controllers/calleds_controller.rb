class CalledsController < ApplicationController
  before_action :set_called, only: [:show, :edit, :update, :destroy]

  # GET /calleds
  # GET /calleds.json
  def index

    @calleds = []
    Called.all.each do |called|
      if called.user.id == current_user.id or current_user.admin?
          @calleds << called


      end

    end


  end

  # GET /calleds/1
  # GET /calleds/1.json
  def show
  end

  # GET /calleds/new
  def new
    @called = Called.new
  end

  # GET /calleds/1/edit
  def edit
  end

  # POST /calleds
  # POST /calleds.json
  def create
    @called = Called.new(called_params)

    respond_to do |format|
      if @called.save
        format.html { redirect_to @called, notice: 'Called was successfully created.' }
        format.json { render :show, status: :created, location: @called }
      else
        format.html { render :new }
        format.json { render json: @called.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calleds/1
  # PATCH/PUT /calleds/1.json
  def update
    respond_to do |format|
      if @called.update(called_params)
        format.html { redirect_to @called, notice: 'Called was successfully updated.' }
        format.json { render :show, status: :ok, location: @called }
      else
        format.html { render :edit }
        format.json { render json: @called.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calleds/1
  # DELETE /calleds/1.json
  def destroy

    @called.destroy
    respond_to do |format|
      format.html { redirect_to calleds_url, notice: 'Called was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_called
      @called = Called.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def called_params
      params.require(:called).permit(:affair, :datescheduling, :typecalled, :description, :user_id)
    end
end
