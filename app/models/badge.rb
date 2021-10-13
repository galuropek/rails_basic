class Badge < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :rule

  validates :title, presence: true,
                    uniqueness: true

  enum rule_type: %w[category level first_attempt]

end
