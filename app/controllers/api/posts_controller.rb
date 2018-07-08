class Api::PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  load_and_authorize_resource
  # GET /api/posts
  def index
    posts = Post.includes(:tags, :post_items).page(params[:page])
    render json: posts, each_serializer: PostSerializer
  end

  # GET /api/posts/:id
  def show
    post = Post.find(params[:id])
    render json: PostSerializer.new(post)
  end

  # GET /api/posts/new
  def new
    post = Post.new
    render json: PostSerializer.new(post)
  end

  # GET /api/posts/:id/edit
  def edit
    post = Post.find(params[:id])
    render json: PostSerializer.new(post)
  end

  # POST /api/posts
  def create
    post = Post.new(post_params)
    post.save
    raise unless post.save
    head :created
  end

  # PATCH/PUT /api/posts/:id
  def update
    post = Post.find(params[:id])
    post.update(post_params)
    raise unless post.update(post_params)
    head :ok
  end

  # DELETE /api/posts/:id
  def destroy
    post = Post.find(params[:id])
    if post.destroy
      head :no_content, status: :ok
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :lead_sentence, :accepted, :topic, tags_attributes: %i[name], post_items_attributes: %i[image remove_image image_cache description sort_rank])
  end
end
