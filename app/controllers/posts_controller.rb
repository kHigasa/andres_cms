class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit]
  before_action :set_post, only: %i[show edit]
  load_and_authorize_resource
  add_breadcrumb "#{Post.model_name.human}#{I18n.t('misc.index')}", :posts_path
  # GET /posts
  def index
    @q = Post.all.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/:id/edit
  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :lead_sentence, :accepted, :published_at, :topic)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
