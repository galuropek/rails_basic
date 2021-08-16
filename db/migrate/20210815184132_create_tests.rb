class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, default: 0
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
    # add_index :tests, :category_id
  end
end
