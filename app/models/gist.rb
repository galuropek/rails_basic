class Gist < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  SHORT_QUESTION_CHARS_COUNT = 25

  def short_question_body
    question.body.truncate(SHORT_QUESTION_CHARS_COUNT)
  end

  def url_hash
    url[/gist\.github\.com\/(\w+)/, 1]
  end
end
