class Rule < ActiveRecord::Base
  belongs_to :category
  has_one :badge

  validates :title, presence: true

  def accept!
    raise 'Not implemented!'
  end

  def notification
    raise 'Not implemented!'
  end
end
