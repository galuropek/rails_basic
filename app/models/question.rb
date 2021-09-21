class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers
  has_many :gists

  validates :body, presence: true
end
