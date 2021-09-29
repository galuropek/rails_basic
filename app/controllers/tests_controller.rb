class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tests, only: %i[index start]
  before_action :set_test, only: :start

  def index; end

  def start
    if @test.questions.any?
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash.now[:danger] = t('.no_questions', title: @test.title)
      render :index
    end
  end

  private

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
