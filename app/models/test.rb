class Test < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :creator, foreign_key: "user_id", class_name: 'User'

  validates :title, presence: true,
                    uniqueness: {scope: :level}
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :tests_by_category_name, -> (category_name) {
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', category_name)
  }

  def self.titles_by_category_name(category_name)
    tests_by_category_name(category_name).order(title: :desc).pluck(:title)
  end
end
