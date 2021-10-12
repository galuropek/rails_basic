class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :rule_type, null: false
      t.string :value, default: ''

      t.timestamps null: false
    end
  end
end
