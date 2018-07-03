class Api::PostsController < ApplicationController
  # GET /api/posts
  def index
    posts = Post.all.page(params[:page])
    render json: posts, each_serializer: PostSerializer
  end

  # GET /api/posts/:id
  def show
    post = Post.find(params[:id])
    render json: PostSerializer.new(post)
  end
end
