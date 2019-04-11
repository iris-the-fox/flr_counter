class ReviewsController < ApplicationController
  before_action :set_group
  before_action :set_story
  before_action :set_review, only: [:show, :edit, :update, :destroy]


  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @story.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @story.reviews.new()
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @story.reviews.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@story, @review], notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to [@story, @review], notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to story_reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_group
      @group = Group.find_by(user_id: current_user, flr_id: @current_flr)
    end

    def set_story
      @story = @group.stories.find(params[:story_id])
    end
    def set_review
      @review = @story.reviews.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:story_id, :text, :link, :author)
    end
end