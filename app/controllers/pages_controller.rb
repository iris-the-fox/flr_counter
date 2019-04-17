class PagesController < ApplicationController
  before_action :set_flr, only: [:index, :new, :create, :all_pages]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    @pages = @flr.pages.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end


  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to flr_pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all_pages

    (@flr.first_page..@flr.last_page).each do |page|
      some_page = PageWS.new(page, @flr.link)

      @page = @flr.pages.find_or_create_by(body: some_page.body, link: some_page.link, number: some_page.number)

    end
    @flr.first_page = @flr.last_page-1
    @flr.save

    redirect_to flr_pages_path, notice: 'Pages was successfully added.'

  end  

  private

    def set_flr
      @flr = Flr.find(params[:flr_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:body, :number, :link, :flr_id)
    end
end
