class Category < ActiveRecord::Base
  has_many :tests
  has_many :rules

  validates :title, presence: true

  default_scope { order(title: :asc) }

  def accept!
    raise 'not implement'
  end
end
