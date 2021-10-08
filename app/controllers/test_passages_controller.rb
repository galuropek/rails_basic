class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rules, only: :update
  before_action :set_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    answer_ids = params.dig(:answer, :answer_ids)
    return empty_answer if answer_ids.nil? || answer_ids.empty?

    @test_passage.accept!(answer_ids)

    if @test_passage.completed?
      badges = deserved_badges
      flash[:success] = badges.map(&:notification).join("\n") if badges.any?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    gist_question_service = GistQuestionService.new(@test_passage.current_question)
    result = gist_question_service.call
    flash_options =
      if gist_question_service.success?
        current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
        { success: t('.success', url: result.html_url) }
      else
        { danger: t('.failed') }
      end

    redirect_to @test_passage, flash: flash_options
  end

  private

  def empty_answer
    flash.now[:danger] = t('.empty_answer')
    render :show
  end

  def deserved_badges
    @rules.map { |rule| rule.accept!(current_user) }.compact
  end

  def set_rules
    @rules = Rule.all
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
