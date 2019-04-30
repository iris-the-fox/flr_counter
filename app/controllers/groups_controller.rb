# frozen_string_literal: true

class GroupsController < ApplicationController
  before_action :set_flr, only: %i[index new create]
  before_action :set_group, only: %i[show edit update destroy show_column]
  before_action :group_owner, only: %i[edit update destroy]

  # GET /groups
  # GET /groups.json
  def index
    @groups = @flr.groups.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
    @stories = @group.stories
  end

  # GET /groups/new
  def new
    @group = @flr.groups.new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups
  # POST /groups.json
  def create
    @group = @flr.groups.new(group_params)
    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @flr = @group.flr
    @group.destroy
    redirect_to flr_groups_url(@flr), notice: 'Group was successfully destroyed.'
  end

  def show_column
    @exept_general = @group.stories.where(general: false)
    general = @group.stories.find_by(general: true)
    general.nil? ?  @general_reviews = {} : @general_reviews = general.reviews
    render '/groups/column.text.erb', layout: false, content_type: 'text/plain'
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_flr
    @flr = Flr.find(params[:flr_id])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def group_params
    params.require(:group).
           permit(:number, :name, :color, :flr_id, :user_id, :all_stories, :mot_text, :last_update)
  end

  def group_owner
    unless @group.user_id == current_user.id
      flash[:notice] = 'Доступ запрещен, вы не куратор данной группы'
      redirect_to groups_path
    end
  end
end
