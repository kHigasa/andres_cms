class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_user, only: %i[show edit update destroy]
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/:id/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(post_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  # DELETE /users/:id
  def destroy
    if @user.destroy
      render status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :image, :introduction, :description, :admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
