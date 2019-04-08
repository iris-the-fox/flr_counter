class FlrsController < ApplicationController
  before_action :authenticate_user!
  before_action do 
    redirect_to new_user_session_path unless current_user && current_user.admin?
  end
  before_action :set_flr, only: [:show, :edit, :update, :destroy]



  # GET /flrs
  # GET /flrs.json
  def index
    @flrs = Flr.all
  end

  # GET /flrs/1
  # GET /flrs/1.json
  def show
  end

  # GET /flrs/new
  def new
    @flr = Flr.new
  end

  # GET /flrs/1/edit
  def edit
  end

  # POST /flrs
  # POST /flrs.json
  def create
    @flr = Flr.new(flr_params)

    respond_to do |format|
      if @flr.save
        format.html { redirect_to @flr, notice: 'Flr was successfully created.' }
        format.json { render :show, status: :created, location: @flr }
      else
        format.html { render :new }
        format.json { render json: @flr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flrs/1
  # PATCH/PUT /flrs/1.json
  def update
    respond_to do |format|
      if @flr.update(flr_params)
        format.html { redirect_to @flr, notice: 'Flr was successfully updated.' }
        format.json { render :show, status: :ok, location: @flr }
      else
        format.html { render :edit }
        format.json { render json: @flr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flrs/1
  # DELETE /flrs/1.json
  def destroy
    @flr.destroy
    respond_to do |format|
      format.html { redirect_to flrs_url, notice: 'Flr was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flr
      @flr = Flr.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flr_params
      params.require(:flr).permit(:number, :start_date, :info, :link, :current)
    end
end
