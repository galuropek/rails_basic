class CreateTestsUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :users, :tests
    # create_table :testsusers do |t|
    #   t.integer :test_id
    #   t.integer :user_id
    #
    #   t.timestamps null: false
    # end
  end
end
