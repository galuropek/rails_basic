class Gist < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  SHORT_QUESTION_CHARS_COUNT = 25

  def short_question_body
    body = question.body

    if body.length > SHORT_QUESTION_CHARS_COUNT
      "#{body[0..SHORT_QUESTION_CHARS_COUNT - 1]}..."
    else
      body
    end
  end

  def url_hash
    url[/gist\.github\.com\/(\w+)/, 1]
  end
end
