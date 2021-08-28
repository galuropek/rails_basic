class AddIndexToTest < ActiveRecord::Migration
  def change
    add_index :tests, [:title, :level], unique: true
  end
end
