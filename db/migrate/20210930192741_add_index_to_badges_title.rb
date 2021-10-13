class AddIndexToBadgesTitle < ActiveRecord::Migration
  def change
    add_index :badges, :title, unique: true
  end
end
