class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_count

  private

  def validate_answers_count
    min, max = [1, 4]
    errors.add(:answers_count, "expected count between %s and %s" % [min, max]) unless
      answers.size.between?(min, max)
  end
end
