class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.boolean :admin

      t.timestamps null: false
    end
  end
end
