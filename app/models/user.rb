class User < ActiveRecord::Base
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id

  validates :email, presence: true

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
