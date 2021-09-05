class Answer < ActiveRecord::Base
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  MAX_ANSWERS_COUNT = 4

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_answers_count
    if question && question.answers.size > MAX_ANSWERS_COUNT
      errors.add(:answers_count, "expected: question contains <= #{MAX_ANSWERS_COUNT} answers")
    end
  end
end
