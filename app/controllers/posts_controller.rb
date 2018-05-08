class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
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

  # POST /posts
  def create
  end

  # PATCH/PUT /posts/:id
  def update
  end

  # DELETE /posts/:id
  def destroy
  end
end
