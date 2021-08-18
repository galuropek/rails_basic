class CreateTestsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :tests
  end
end
