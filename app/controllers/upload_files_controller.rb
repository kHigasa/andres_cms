class UploadFilesController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_upload_file, only: %i[edit update destroy download]
  load_and_authorize_resource
  add_breadcrumb "#{UploadFile.model_name.human}#{I18n.t('misc.index')}", :history_upload_files_path
  # GET /histories/:history_generation_code/upload_files
  def index
    @q = UploadFile.all.ransack(params[:q])
    @upload_files = @q.result.page(params[:page])
  end

  # GET /histories/:history_generation_code/upload_files/new
  def new
    @upload_file = UploadFile.new
  end

  # GET /histories/:history_generation_code/upload_files/:id/edit
  def edit
  end

  # POST /histories/:history_generation_code/upload_files
  def create
    @upload_file = UploadFile.new(upload_file_params)
    if @upload_file.errors.empty? && @upload_file.save
      redirect_to history_upload_files_path, notice: I18n.t('activerecord.flash.upload_file.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.upload_file.actions.create.failure')
    end
  end

  # PATCH/PUT /histories/:history_generation_code/upload_files/:id
  def update
    if @upload_file.errors.empty? && @upload_file.update(upload_file_params)
      redirect_to history_upload_files_path, notice: I18n.t('activerecord.flash.upload_file.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.upload_file.actions.update.failure')
    end
  end

  # DELETE /histories/:history_generation_code/upload_files/:id
  def destroy
    if @upload_file.destroy
      redirect_to history_upload_files_path, notice: I18n.t('activerecord.flash.upload_file.actions.destroy.success')
    else
      redirect_to history_upload_files_path, alert: I18n.t('activerecord.flash.upload_file.actions.destroy.failure')
    end
  end

  def download
    file_path = @upload_file.file.path
    file_name = @upload_file.name
    send_file(file_path, file_name: file_name)
  end

  private

  def upload_file_params
    params.require(:upload_file).permit(:history_id, :name, :file)
  end

  def set_upload_file
    @upload_file = UploadFile.find(params[:id])
  end
end
