class DropTableTestsUsers < ActiveRecord::Migration
  def up
    drop_table :tests_users, if_exists: true
  end
end
