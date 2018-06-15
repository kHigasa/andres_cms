class HistoriesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_history, only: %i[show edit update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{History.model_name.human}#{I18n.t('misc.index')}", :histories_path
  # GET /histories
  def index
    @q = History.all.ransack(params[:q])
    @histories = @q.result.page(params[:page])
  end

  # GET /histories/:generation_code
  def show
  end

  # GET /histories/new
  def new
  end

  # GET /histories/:generation_code/edit
  def edit
  end

  # POST /histories
  def create
  end

  # PATCH/PUT /histories/:generation_code
  def update
  end

  # DELETE /histories/:generation_code
  def destroy
  end

  private

  def history_params
    params.require(:history).permit(:generation_code, :generation_name, :image, :description, :file, :file_type)
  end

  def set_history
    @history = History.find(params[:generation_code])
  end
end
