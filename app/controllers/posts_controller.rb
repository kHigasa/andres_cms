class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit]
  load_and_authorize_resource
  add_breadcrumb "#{Post.model_name.human}#{I18n.t('misc.index')}", :posts_path
  # GET /posts
  def index
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
  end

  # GET /posts/:id/edit
  def edit
  end
end
