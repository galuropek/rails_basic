class AddSuccessToTestPassages < ActiveRecord::Migration
  def change
    add_column :test_passages, :success, :boolean, default: false
    add_column :test_passages, :category_achievement, :boolean, default: false
    add_column :test_passages, :level_achievement, :boolean, default: false
  end
end
