class ReviewsController < ApplicationController


  before_action :set_story, only: [:index, :new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :group_owner, only:  [:new, :create]

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
        format.html { redirect_to  @review, notice: 'Review was successfully created.' }
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
        format.html { redirect_to  @review, notice: 'Review was successfully updated.' }
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
    @story = @review.story
    @review.destroy
    respond_to do |format|
      format.html { redirect_to story_reviews_url(@story), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
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
      params.require(:review).permit(:story_id, :text, :link, :author)
    end
end
