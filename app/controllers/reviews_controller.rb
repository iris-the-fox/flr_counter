class ReviewsController < ApplicationController
  before_action :set_story, only: %i[index new create]
  before_action :set_review, only: %i[show edit update destroy]
  before_action :group_owner, only:  %i[new create]

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
    @review = @story.reviews.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @story.reviews.new(review_params)
    if @review.save
      redirect_to  @review.story, notice: 'Review was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to  @review.story, notice: 'Review was successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @story = @review.story
    @review.destroy
    redirect_to story_reviews_url(@story), notice: 'Review was successfully destroyed.' 
  end

  private
    # Use callbacks to share common setup or constraints between actions.

  def set_story
    @story = Story.find(params[:story_id])
  end
  
  def set_review
    @review = Review.find(params[:id])
  end

  def group_owner
    if @story.group.user != current_user
     flash[:notice] = 'Доступ запрещен, вы не куратор данной группы'
     redirect_to flr_path(@review.story.group.flr)
     
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:story_id, :text, :link, :author, :group_id)
  end
end
