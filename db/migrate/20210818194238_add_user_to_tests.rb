class AddUserToTests < ActiveRecord::Migration
  def change
    add_reference :tests, :user, foreign_key: true
  end
end
