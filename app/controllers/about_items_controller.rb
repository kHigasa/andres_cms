class AboutItemsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_about_item, only: %i[edit update destroy move_first move_previous move_next move_last]
  load_and_authorize_resource
  # GET /about
  def index
    @about_items = AboutItem.all.order(sort_id: :asc)
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
    if @about_item.errors.empty? && @about_item.save
      redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.about_item.actions.create.failure')
    end
  end

  # PATCH/PUT /about_items/:id
  def update
    if @about_item.errors.empty? && @about_item.update(about_item_params)
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

  def move_first
    first_about_item = AboutItem.find_by(sort_id: 1)
    second_about_item = AboutItem.find_by(sort_id: 2)
    if first_about_item.present? && second_about_item.present?
      remaining_about_items = AboutItem.where(['(sort_id >= ?) AND (sort_id < ?)', 2, @about_item.sort_id])
      remaining_about_items.order(sort_id: :asc).each do |remaining_about_item|
        remaining_about_item.sort_id += 1
        remaining_about_item.save!(validate: false)
      end
      first_about_item.sort_id = 2
      first_about_item.save!(validate: false)
    end
    @about_item.sort_id = 1
    @about_item.save!(validate: false)
    redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.move_first.success')
  end

  def move_previous
    previous_about_item = AboutItem.where('sort_id < ?', @about_item.sort_id).order(sort_id: :desc).first
    if previous_about_item.present?
      @about_item.sort_id, previous_about_item.sort_id = previous_about_item.sort_id, @about_item.sort_id
      previous_about_item.save!(validate: false)
    else
      @about_item.sort_id -= 1
    end
    @about_item.save!(validate: false)
    redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.move_previous.success')
  end

  def move_next
    next_about_item = AboutItem.where('sort_id > ?', @about_item.sort_id).order(sort_id: :asc).first
    if next_about_item.present?
      @about_item.sort_id, next_about_item.sort_id = next_about_item.sort_id, @about_item.sort_id
      next_about_item.save!(validate: false)
    else
      @about_item.sort_id += 1
    end
    @about_item.save!(validate: false)
    redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.move_next.success')
  end

  def move_last
    last_about_item = AboutItem.order(sort_id: :asc).last
    last_but_one_about_item = AboutItem.find_by(sort_id: last_about_item.sort_id - 1)
    if last_about_item.present? && last_but_one_about_item.present?
      remaining_about_items = AboutItem.where(['(sort_id > ?) AND (sort_id <= ?)', @about_item.sort_id, last_about_item.sort_id])
      remaining_about_items.order(sort_id: :asc).each do |remaining_about_item|
        remaining_about_item.sort_id -= 1
        remaining_about_item.save!(validate: false)
      end
      last_about_item.sort_id -= 1
      last_about_item.save!(validate: false)
    end
    @about_item.sort_id = last_about_item.sort_id + 1
    @about_item.save!(validate: false)
    redirect_to about_path, notice: I18n.t('activerecord.flash.about_item.actions.move_last.success')
  end

  private

  def about_item_params
    params.require(:about_item).permit(:sort_id, :image, :description, :image_cache, :remove_image)
  end

  def set_about_item
    @about_item = AboutItem.find(params[:id])
  end
end
