class TestPassage < ActiveRecord::Base
  belongs_to :user
  belongs_to :test
  belongs_to :current_question
end
