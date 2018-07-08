class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{Post.model_name.human}#{I18n.t('misc.index')}", :posts_path
  # GET /posts
  def index
    @q = Post.includes(:tags, :post_items).where(accepted: true).order(created_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  # GET /posts/:id
  def show
    @post_items = @post.post_items.order(sort_rank: :asc)
    @tags = @post.tags
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.tags.build
    @post.post_items.build
  end

  # GET /posts/:id/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.errors.empty? && @post.save
      render :edit, notice: I18n.t('activerecord.flash.post.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.post.actions.create.failure')
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.errors.empty? && @post.update(post_params)
      render :edit, notice: I18n.t('activerecord.flash.post.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.post.actions.update.failure')
    end
  end

  # DELETE /posts/:id
  def destroy
    if @post.destroy
      redirect_to posts_path, notice: I18n.t('activerecord.flash.post.actions.destroy.success')
    else
      redirect_to admin_posts_path, alert: I18n.t('activerecord.flash.post.actions.destroy.failure')
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :lead_sentence, :topic, :accepted, tags_attributes: %i[name _destroy], post_items_attributes: %i[image remove_image image_cache description sort_rank _destroy])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
