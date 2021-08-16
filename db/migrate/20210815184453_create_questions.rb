class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :body, null: false
      t.references :test, foreign_key: true

      t.timestamps null: false
    end
  end
end
