class Answer < ActiveRecord::Base
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }
end
