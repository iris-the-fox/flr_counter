# frozen_string_literal: true

class FlrsController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :set_flr, only: %i[show edit update destroy retrieve_pages]

  # GET /flrs
  # GET /flrs.json
  def index
    @flrs = Flr.all
  end

  # GET /flrs/1
  # GET /flrs/1.json
  def show
    @groups = @flr.groups
  end

  # GET /flrs/new
  def new
    @flr = Flr.new
  end

  # GET /flrs/1/edit
  def edit; end

  # POST /flrs
  # POST /flrs.json
  def create
    @flr = Flr.new(flr_params)
    if @flr.save
      redirect_to @flr, notice: 'Flr was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flrs/1
  # PATCH/PUT /flrs/1.json
  def update
    if @flr.update(flr_params)
      redirect_to @flr, notice: 'Flr was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flrs/1
  # DELETE /flrs/1.json
  def destroy
    @flr.destroy
    redirect_to flrs_url, notice: 'Flr was successfully destroyed.'
  end

  def get_last_page
    Flr.retrieve_last_page
    redirect_to @current_flr, notice: 'Last page was successfully added.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_flr
    @flr = Flr.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def flr_params
    params.require(:flr).permit(:number, :start_date, :info, :link, :current, :first_page, :last_page)
  end
end
