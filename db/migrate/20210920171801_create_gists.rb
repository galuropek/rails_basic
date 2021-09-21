class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.string :url, null: false
      t.references :question, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
