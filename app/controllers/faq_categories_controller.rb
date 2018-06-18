class FaqCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_faq_category, only: %i[update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{FaqCategory.model_name.human}#{I18n.t('misc.index')}", :faq_categories_path
  # GET /faq_categorys
  def index
    @q = FaqCategory.all.ransack(params[:q])
    @faq_categories = @q.result.page(params[:page])
  end

  # GET /faq_categorys/new
  def new
    @faq_category = FaqCategory.new
  end

  # GET /faq_categorys/:id/edit
  def edit
  end

  # POST /faq_categorys
  def create
    @faq_category = FaqCategory.new(faq_category_params)
    if @faq_category.errors.empty? && @faq_category.save
      redirect_to faq_categories_path, notice: I18n.t('activerecord.flash.faq_category.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.faq_category.actions.create.failure')
    end
  end

  # PATCH/PUT /faq_categorys/:id
  def update
    if @faq_category.errors.empty? && @faq_category.update(faq_category_params)
      redirect_to faq_categories_path, notice: I18n.t('activerecord.flash.faq_category.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.faq_category.actions.update.failure')
    end
  end

  # DELETE /faq_categorys/:id
  def destroy
    if @faq_category.destroy
      redirect_to faq_categories_path, notice: I18n.t('activerecord.flash.faq_category.actions.destroy.success')
    else
      redirect_to faq_categories_path, alert: I18n.t('activerecord.flash.faq_category.actions.destroy.failure')
    end
  end

  private

  def faq_category_params
    params.require(:faq_category).permit(:category)
  end

  def set_faq_category
    @faq_category = FaqCategory.find(params[:id])
  end
end
