class Admin::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: [:new, :create]
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render html: '<h2>Question not found!</h2>'.html_safe
  end
end
