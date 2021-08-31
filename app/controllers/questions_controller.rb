class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.map(&:body).join("\n")
  end

  def new
  end

  def show
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: "Question has been saved!"
    else
      render plain: "Something went wrong!"
    end
  end

  def destroy
    if @question.destroy
      render plain: "Question has been removed!"
    else
      render plain: "Something went wrong!"
    end
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render html: '<h2>Question not found!</h2>'.html_safe
  end
end
