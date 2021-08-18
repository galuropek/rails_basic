class AddUserToTests < ActiveRecord::Migration
  def change
    add_reference :tests, :user, index: true, foreign_key: true
  end
end
