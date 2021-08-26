class Category < ActiveRecord::Base
  has_many :tests

  validates :title, presence: true

  default_scope { order(title: :asc) }
end
