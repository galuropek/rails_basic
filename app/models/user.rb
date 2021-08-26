class User < ActiveRecord::Base
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'

  validates :email, presence: true

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
