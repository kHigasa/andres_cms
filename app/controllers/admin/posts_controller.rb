class Admin::PostsController < ApplicationController
  # GET /admin/posts
  def index
    @q = Post.all.order(id: :asc).ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end
end
