class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.references :question, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
