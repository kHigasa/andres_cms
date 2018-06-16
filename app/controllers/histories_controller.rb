class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_history, only: %i[show edit destroy]
  load_and_authorize_resource
  add_breadcrumb "#{History.model_name.human}#{I18n.t('misc.index')}", :histories_path
  # GET /histories
  def index
    @q = History.all.ransack(params[:q])
    @histories = @q.result.page(params[:page])
  end

  # GET /histories/:generation_code
  def show
  end

  # GET /histories/new
  def new
    @history = History.new
  end

  # GET /histories/:generation_code/edit
  def edit
  end

  # POST /histories
  def create
    @history = History.new(history_params)
    if @history.errors.empty? && @history.save
      redirect_to histories_path, notice: I18n.t('activerecord.flash.history.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.history.actions.create.failure')
    end
  end

  # PATCH/PUT /histories/:generation_code
  def update
    @history = History.find_by(id: params[:generation_code])
    if @history.errors.empty? && @history.update(history_params)
      redirect_to histories_path, notice: I18n.t('activerecord.flash.history.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.history.actions.update.failure')
    end
  end

  # DELETE /histories/:generation_code
  def destroy
    if @history.destroy
      redirect_to histories_path, notice: I18n.t('activerecord.flash.history.actions.destroy.success')
    else
      redirect_to histories_path, alert: I18n.t('activerecord.flash.history.actions.destroy.failure')
    end
  end

  private

  def set_history
    @history = History.find_by(generation_code: params[:generation_code])
  end

  def history_params
    params.require(:history).permit(:generation_code, :generation_name, :image, :remove_image, :image_cache, :description, :file, :file_type)
  end
end
