class TestPassage < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question'

  before_validation :before_validation_set_test_question, on: :create
  before_update :before_save_set_next_question, on: :update, unless: :completed?

  SUCCESS_THRESHOLD = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    correct_questions_percentage >= SUCCESS_THRESHOLD
  end

  def correct_questions_percentage
    (correct_questions.to_f / test.questions.count * 100).round(2)
  end

  def question_number
    test.questions.order(:id).index(current_question).next
  end

  def percentage_progress(round: 2)
    ((question_number - 1).to_f / test.questions.count * 100).round(round)
  end

  def time_left
    return 0 if time_over?

    (created_at + test.time_in_seconds - Time.now).ceil
  end

  def time_over?
    return false unless test.timer?

    Time.now > created_at + test.time_in_seconds
  end

  private

  def before_validation_set_test_question
    self.current_question = test.questions.first
  end

  def before_save_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    self.success = true if completed? && success? && !time_over?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end
end
