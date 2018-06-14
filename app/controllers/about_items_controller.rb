class AboutItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[show new edit create update destroy]
  before_action :set_about_item, only: %i[show edit update destroy]
  load_and_authorize_resource
  # GET /about
  def index
    @about_items = AboutItem.all
  end

  # GET /about_items/:id
  def show
  end

  # GET /about_items/new
  def new
    @about_item = AboutItem.new
  end

  # GET /about_items/:id/edit
  def edit
  end

  # POST /about_items
  def create
    @about_item = AboutItem.new(about_item_params)
    if @about_item.save
      redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.about_item.actions.create.failure')
    end
  end

  # PATCH/PUT /about_items/:id
  def update
    if @about_item.update(about_item_params)
      redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.about_item.actions.update.failure')
    end
  end

  # DELETE /about_items/:id
  def destroy
    if @about_item.destroy
      redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.destroy.success')
    else
      redirect_to about_path, alert: I18n.t('activerecord.flash.about_item.actions.destroy.failure')
    end
  end

  def moveup
  end

  def movedown
  end

  private

  def about_item_params
    params.require(:about_item).permit(:sort_id, :image, :description)
  end

  def set_about_item
    @about_item = AboutItem.find(params[:id])
  end
end
