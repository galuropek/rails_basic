class AddUsersPasswordNullConstraint < ActiveRecord::Migration
  def change
    change_column_null(:users, :password, false)
  end
end
