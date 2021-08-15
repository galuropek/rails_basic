class AddTestsLevelSetDefaultValue < ActiveRecord::Migration
  def change
    change_column_default(:tests, :level, 0)
  end
end
