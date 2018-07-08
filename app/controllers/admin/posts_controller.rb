class Admin::PostsController < ApplicationController
  add_breadcrumb "#{Post.model_name.human}#{I18n.t('misc.index')}", :posts_path
  # GET /posts
  def index
    @q = Post.includes(:tags).order(created_at: :desc).ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end
end
