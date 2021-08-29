class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: Question.all.map(&:body).join("\n")
  end

  def new
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @test.questions.create(question_params)
    redirect_to test_questions_path
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to test_questions_path
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render html: '<h2>Question not found!</h2>'.html_safe
  end
end
