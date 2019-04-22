# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :set_group, only: %i[index new create]
  before_action :group_owner, only: %i[new create]
  before_action :set_story, only: %i[show edit update destroy show_column]

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
    @story = @group.stories.new
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
    if @story.save
      redirect_to @story, notice: 'Story was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    if @story.update(story_params)
      redirect_to @story, notice: 'Story was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @group = @story.group
    @story.destroy
    redirect_to group_stories_url(@group), notice: 'Story was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_story
    @story = Story.find(params[:id])
  end

  def group_owner
    if @group.nil?
      flash[:notice] = 'Доступ запрещен, вы не куратор данной группы'
      redirect_to groups_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:name, :link, :group_id, reviews_attributes: Review.attribute_names.map(&:to_sym).push(:_destroy))
  end
end
