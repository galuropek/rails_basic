class AddTestsTitleNullConstraint < ActiveRecord::Migration
  def change
    change_column_null(:tests, :title, false)
  end
end
