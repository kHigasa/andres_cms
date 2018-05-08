class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_topic, only: %i[show edit update destroy]
  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
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

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      render json: @post
    else
      render :new
    end
  end

  # PATCH/PUT /posts/:id
  def update
    if @post.update(post_params)
      redirect_to posts_path
      render json: @post
    else
      render :edit
    end
  end

  # DELETE /posts/:id
  def destroy
    if @post.destroy
      render json: {}, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :lead_sentence, :accepted, :published_at, :topic_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
