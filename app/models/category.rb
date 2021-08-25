class Category < ActiveRecord::Base
  has_many :tests

  default_scope { order(title: :asc) }
end
