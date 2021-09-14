class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable,
         :trackable, :rememberable, :validatable, :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    self.tests.where(level: level)
  end

  def user_representation
    first_name.present? ? first_name : email
  end

  def admin?
    self.is_a?(Admin)
  end
end
