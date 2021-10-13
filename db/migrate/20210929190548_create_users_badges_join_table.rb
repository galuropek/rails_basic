class CreateUsersBadgesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :badges
  end
end
