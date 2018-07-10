class SupportersController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_supporter, only: %i[update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{Supporter.model_name.human}#{I18n.t('misc.index')}", :supporters_path
  # GET /supporters
  def index
    @supporters = Supporter.all
  end

  # GET /supporters/new
  def new
    @supporter = Supporter.new
  end

  # GET /supporters/:id/edit
  def edit
  end

  # POST /supporters
  def create
    @supporter = Supporter.new(supporter_params)
    if @supporter.errors.empty? && @supporter.save
      redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.supporter.actions.create.failure')
    end
  end

  # PATCH/PUT /supporters/:id
  def update
    if @supporter.errors.empty? && @supporter.update(supporter_params)
      redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.supporter.actions.update.failure')
    end
  end

  # DELETE /supporters/:id
  def destroy
    if @supporter.destroy
      redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.destroy.success')
    else
      redirect_to supporters_path, alert: I18n.t('activerecord.flash.supporter.actions.destroy.failure')
    end
  end

  private

  def supporter_params
    params.require(:supporter).permit(:type, :image, :image_cache, :remove_image, :url)
  end

  def set_supporter
    @supporter = Supporter.find(params[:id])
  end
end
