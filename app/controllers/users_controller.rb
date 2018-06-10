class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_user, only: %i[show edit update destroy activate suspend]
  add_breadcrumb "#{User.model_name.human}#{I18n.t('misc.index')}", :users_path
  # GET /users
  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result.page(params[:page])
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
    if @user == current_user
      render :edit
    else
      redirect_to users_path, alert: I18n.t('activerecord.flash.user.actions.edit.failure')
    end
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: I18n.t('activerecord.flash.user.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.user.actions.create.failure')
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to users_path, notice: I18n.t('activerecord.flash.user.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.user.actions.update.failure')
    end
  end

  # DELETE /users/:id
  def destroy
    if @user.destroy
      redirect_to users_path, notice: I18n.t('activerecord.flash.user.actions.destroy.success')
    else
      redirect_to users_path, alert: I18n.t('activerecord.flash.user.actions.destroy.failure')
    end
  end

  def activate
    @user.update(admin: true) unless @user.admin?
    if @user.admin?
      redirect_to users_path, notice: I18n.t('activerecord.flash.user.actions.activate.success')
    else
      redirect_to users_path, alert: I18n.t('activerecord.flash.user.actions.activate.failure')
    end
  end

  def suspend
    @user.update(admin: false) if @user.admin?
    if !@user.admin?
      redirect_to users_path, notice: I18n.t('activerecord.flash.user.actions.suspend.success')
    else
      redirect_to users_path, alert: I18n.t('activerecord.flash.user.actions.suspend.failure')
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :image, :introduction, :description)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
