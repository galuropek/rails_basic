class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
    # add_index :questions, :test_id
  end
end
