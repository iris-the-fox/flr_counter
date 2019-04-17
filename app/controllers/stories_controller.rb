class StoriesController < ApplicationController
  before_action :set_group, only: [:index, :new, :create]
  before_action :group_owner, only:  [:new, :create]
  before_action :set_story, only: [:show, :edit, :update, :destroy, :show_column]
  

  # GET /stories
  # GET /stories.json
  def index
    @stories = @group.stories
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @reviews = @story.reviews
  end

  # GET /stories/new
  def new
    @story = @group.stories.new()
    @story.reviews.build
  end

  # GET /stories/1/edit
  def edit
    @story.reviews.build
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = @group.stories.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find_by(user_id: current_user)
    end

    def set_story
      @story = Story.find(params[:id])
    end

    def group_owner
     if @group == nil
      flash[:notice] = 'Доступ запрещен, вы не куратор данной группы'
      redirect_to groups_path

     end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:name, :link, :group_id, reviews_attributes: Review.attribute_names.map(&:to_sym).push(:_destroy),)
    end
end
