class AddRuleToBadges < ActiveRecord::Migration
  def change
    add_reference :badges, :rule, index: true, foreign_key: true
  end
end
