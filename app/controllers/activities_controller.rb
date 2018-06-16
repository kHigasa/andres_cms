class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_activity, only: %i[edit update destroy]
  load_and_authorize_resource
  # GET /histories/:history_generation_code/activities
  def index
    @activities = Activity.all
  end

  # GET /histories/:history_generation_code/activities/new
  def new
    @activity = Activity.new
  end

  # GET /histories/:history_generation_code/activities/:id/edit
  def edit
  end

  # POST /histories/:history_generation_code/activities
  def create
    @activity = Activity.new(activity_params)
    if @activity.errors.empty? && @activity.save
      redirect_to history_activities_path, notice: I18n.t('activerecord.flash.activity.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.activity.actions.create.failure')
    end
  end

  # PATCH/PUT /histories/:history_generation_code/activities/:id
  def update
    if @activity.errors.empty? && @activity.update(activity_params)
      redirect_to history_activities_path, notice: I18n.t('activerecord.flash.activity.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.activity.actions.update.failure')
    end
  end

  # DELETE /histories/:history_generation_code/activities/:id
  def destroy
    if @activity.destroy
      redirect_to history_activities_path notice: I18n.t('activerecord.flash.activity.actions.destroy.success')
    else
      redirect_to history_activities_path, alert: I18n.t('activerecord.flash.activity.actions.destroy.failure')
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:history_id, :title, :content)
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
