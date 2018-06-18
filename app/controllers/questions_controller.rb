class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_question, only: %i[update destroy]
  load_and_authorize_resource
  add_breadcrumb "#{Question.model_name.human}#{I18n.t('misc.index')}", :questions_path
  # GET /questions
  def index
    @questions = Question.all
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/:id/edit
  def edit
  end

  # POST /questions
  def create
    @question = Question.new(question_params)
    if @question.errors.empty? && @question.save
      redirect_to questions_path, notice: I18n.t('activerecord.flash.question.actions.create.success')
    else
      render :new, alert: I18n.t('activerecord.flash.question.actions.create.failure')
    end
  end

  # PATCH/PUT /questions/:id
  def update
    if @question.errors.empty? && @question.update(question_params)
      redirect_to questions_path, notice: I18n.t('activerecord.flash.question.actions.update.success')
    else
      render :edit, alert: I18n.t('activerecord.flash.question.actions.update.failure')
    end
  end

  # DELETE /questions/:id
  def destroy
    if @question.destroy
      redirect_to questions_path, notice: I18n.t('activerecord.flash.question.actions.destroy.success')
    else
      redirect_to questions_path, alert: I18n.t('activerecord.flash.question.actions.destroy.failure')
    end
  end

  private

  def question_params
    params.require(:question).permit(:question_id, :question, :answer)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
