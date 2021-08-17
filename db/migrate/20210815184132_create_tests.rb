class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category, foreign_key: true

      t.timestamps null: false
    end
  end
end
