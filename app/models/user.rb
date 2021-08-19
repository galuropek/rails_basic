class User < ActiveRecord::Base
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'

  def tests_by_level(level)
    self.tests.where(level: level)
  end
end
