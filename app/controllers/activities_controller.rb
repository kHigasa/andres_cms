class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_history, only: %i[index new]
  before_action :set_activity, only: %i[edit update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{History.model_name.human}#{I18n.t('misc.index')}", :histories_path
  # GET /histories/:history_generation_code/activities
  def index
    @activities = Activity.where(history_id: @history.id).order(id: :asc)
  end

  # GET /histories/:history_generation_code/activities/new
  def new
    @activity = Activity.new
  end

  # GET /histories/:history_generation_code/activities/:id/edit
  def edit
    @history = History.find_by(id: params[:history_generation_code])
  end

  # POST /histories/:history_generation_code/activities
  def create
    @activity = Activity.new(activity_params)
    if @activity.errors.empty? && @activity.save
      redirect_to histories_path, notice: I18n.t('activerecord.flash.activity.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.activity.actions.create.failure')
    end
  end

  # PATCH/PUT /histories/:history_generation_code/activities/:id
  def update
    @history = History.find_by(id: params[:generation_code])
    if @activity.errors.empty? && @activity.update(activity_params)
      redirect_to histories_path, notice: I18n.t('activerecord.flash.activity.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.activity.actions.update.failure')
    end
  end

  # DELETE /histories/:history_generation_code/activities/:id
  def destroy
    if @activity.destroy
      redirect_to histories_path, notice: I18n.t('activerecord.flash.activity.actions.destroy.success')
    else
      redirect_to histories_path, alert: I18n.t('activerecord.flash.activity.actions.destroy.failure')
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:history_id, :title, :content)
  end

  def set_history
    @history = History.find_by(generation_code: params[:history_generation_code])
  end

  def set_activity
    @activity = Activity.find(params[:id])
  end
end
