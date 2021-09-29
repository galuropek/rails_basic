class AddIndexes < ActiveRecord::Migration
  def change
    add_index :tests, :user_id
    add_index :tests, :category_id
    add_index :questions, :test_id
    add_index :answers, :question_id
  end
end
