class Api::PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  load_and_authorize_resource
  # GET /api/api/posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /api/posts/:id
  def show
    render json: @post
  end

  # GET /api/posts/new
  def new
    @post = Post.new
    render json: @post
  end

  # GET /api/posts/:id/edit
  def edit
    render json: @post
  end

  # POST /api/posts
  def create
    @post = Post.new(post_params)
    @post.save
    raise unless @post.save
    head :created
  end

  # PATCH/PUT /api/posts/:id
  def update
    @post.update(post_params)
    raise unless @post.update(post_params)
    head :ok
  end

  # DELETE /api/posts/:id
  def destroy
    if @post.destroy
      head :no_content, status: :ok
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
