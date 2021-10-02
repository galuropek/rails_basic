class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable,
         :trackable, :rememberable, :validatable, :confirmable

  has_and_belongs_to_many :badges
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :user_id
  has_many :gists

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    tests.where(level: level)
  end

  def counted_badges_urls
    badges.group_by(&:title).each_with_object({}) do |(_, badges), hash|
      hash[badges.first] = badges.count
    end
  end

  def user_representation
    first_name.present? ? first_name : email
  end

  def admin?
    is_a?(Admin)
  end
end
