class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit]
  load_and_authorize_resource
  add_breadcrumb "#{Post.model_name.human}#{I18n.t('misc.index')}", :posts_path
  # GET /posts
  def index
    @q = Post.all.order(id: :asc).ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  # GET /posts/:id
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
  end

  # GET /posts/:id/edit
  def edit
  end
end
