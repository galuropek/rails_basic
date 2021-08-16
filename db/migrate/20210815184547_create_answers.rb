class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false
      t.references :question, foreign_key: true

      t.timestamps null: false
    end
  end
end
