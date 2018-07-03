class Api::Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]
  load_and_authorize_resource
  # GET /api/admin/posts
  def index
    posts = Post.all.page(params[:page])
    render json: posts, each_serializer: Admin::PostSerializer
  end

  # GET /api/admin/posts/:id
  def show
    render json: Admin::PostSerializer.new(post)
  end

  # GET /api/admin/posts/new
  def new
    post = Post.new
    render json: Admin::PostSerializer.new(post)
  end

  # GET /api/admin/posts/:id/edit
  def edit
    render json: Admin::PostSerializer.new(post)
  end

  # POST /api/admin/posts
  def create
    post = Post.new(post_params)
    post.save
    raise unless post.save
    head :created
  end

  # PATCH/PUT /api/admin/posts/:id
  def update
    post.update(post_params)
    raise unless post.update(post_params)
    head :ok
  end

  # DELETE /api/admin/posts/:id
  def destroy
    if post.destroy
      head :no_content, status: :ok
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :lead_sentence, :accepted, :published_at, :topic)
  end

  def set_post
    post = Post.find(params[:id])
  end
end
