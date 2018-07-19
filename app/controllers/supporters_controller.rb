class SupportersController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_supporter, only: %i[update destroy move_first move_previous move_next move_last]
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

  def move_first
    first_supporter = Supporter.where(type: @supporter.type).find_by(sort_rank: 1)
    second_supporter = Supporter.where(type: @supporter.type).find_by(sort_rank: 2)
    if first_supporter.present? && second_supporter.present?
      remaining_supporters = Supporter.where(type: @supporter.type).where(['(sort_rank >= ?) AND (sort_rank < ?)', 2, @supporter.sort_rank])
      remaining_supporters.order(sort_rank: :asc).each do |remaining_supporter|
        remaining_supporter.sort_rank += 1
        remaining_supporter.save!(validate: false)
      end
      first_supporter.sort_rank = 2
      first_supporter.save!(validate: false)
    end
    @supporter.sort_rank = 1
    @supporter.save!(validate: false)
    redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.move_first.success')
  end

  def move_previous
    previous_supporter = Supporter.where(type: @supporter.type).where('sort_rank < ?', @supporter.sort_rank).order(sort_rank: :desc).first
    if previous_supporter.present?
      @supporter.sort_rank, previous_supporter.sort_rank = previous_supporter.sort_rank, @supporter.sort_rank
      previous_supporter.save!(validate: false)
    else
      @supporter.sort_rank -= 1
    end
    @supporter.save!(validate: false)
    redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.move_previous.success')
  end

  def move_next
    next_supporter = Supporter.where(type: @supporter.type).where('sort_rank > ?', @supporter.sort_rank).order(sort_rank: :asc).first
    if next_supporter.present?
      @supporter.sort_rank, next_supporter.sort_rank = next_supporter.sort_rank, @supporter.sort_rank
      next_supporter.save!(validate: false)
    else
      @supporter.sort_rank += 1
    end
    @supporter.save!(validate: false)
    redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.move_next.success')
  end

  def move_last
    last_supporter = Supporter.where(type: @supporter.type).order(sort_rank: :asc).last
    last_but_one_supporter = Supporter.where(type: @supporter.type).find_by(sort_rank: last_supporter.sort_rank - 1)
    if last_supporter.present? && last_but_one_supporter.present?
      remaining_supporters = Supporter.where(type: @supporter.type).where(['(sort_rank > ?) AND (sort_rank <= ?)', @supporter.sort_rank, last_supporter.sort_rank])
      remaining_supporters.order(sort_rank: :asc).each do |remaining_supporter|
        remaining_supporter.sort_rank -= 1
        remaining_supporter.save!(validate: false)
      end
      last_supporter.sort_rank -= 1
      last_supporter.save!(validate: false)
    end
    @supporter.sort_rank = last_supporter.sort_rank + 1
    @supporter.save!(validate: false)
    redirect_to supporters_path, notice: I18n.t('activerecord.flash.supporter.actions.move_last.success')
  end

  private

  def supporter_params
    params.require(:supporter).permit(:type, :sort_rank, :image, :image_cache, :remove_image, :url)
  end

  def set_supporter
    @supporter = Supporter.find(params[:id])
  end
end
