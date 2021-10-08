class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :title, null: false
      t.string :value, null: false
      t.string :type, null: false, default: 'Rule'
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
