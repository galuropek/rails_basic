class AddCategoriesTitleNullConstraint < ActiveRecord::Migration
  def change
    change_column_null(:categories, :title, false)
  end
end
