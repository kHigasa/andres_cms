class Api::V1::PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  # GET /api/v1/posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /api/v1/posts/:id
  def show
  end

  # GET /api/v1/posts/new
  def new
    @post = Post.new
  end

  # GET /api/v1/posts/:id/edit
  def edit
  end

  # POST /api/v1/posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      render json: @post
    else
      render :new
    end
  end

  # PATCH/PUT /api/v1/posts/:id
  def update
    if @post.update(post_params)
      redirect_to posts_path
      render json: @post
    else
      render :edit
    end
  end

  # DELETE /api/v1/posts/:id
  def destroy
    if @post.destroy
      render json: {}, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :lead_sentence, :accepted, :published_at, :topic)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
