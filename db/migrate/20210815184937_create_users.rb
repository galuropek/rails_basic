class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email, null: false
      t.string :password, null: false
      t.string :first_name
      t.string :last_name
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
