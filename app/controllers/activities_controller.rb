class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_activity, only: %i[show edit update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{Activity.model_name.human}#{I18n.t('misc.index')}", :activities_path
  # GET /activities
  def index
    @q = Activity.all.ransack(params[:q])
    @activities = @q.result.page(params[:page])
  end

  # GET /histories/:history_generation_code/activities/:id
  def show
  end

  # GET /histories/:history_generation_code/activities/new
  def new
  end

  # GET /histories/:history_generation_code/activities/:id/edit
  def edit
  end

  # POST /histories/:history_generation_code/activities
  def create
  end

  # PATCH/PUT /histories/:history_generation_code/activities/:id
  def update
  end

  # DELETE /histories/:history_generation_code/activities/:id
  def destroy
  end

  private

  def activity_params
    params.require(:activity).permit(:history_id, :title, :content)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
