class Test < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :user

  def self.titles_by_category_name(category_name)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', category_name)
      .order(title: :desc)
      .pluck(:title)
  end
end
