class AddQuestionsBodyNullConstraint < ActiveRecord::Migration
  def change
    change_column_null(:questions, :body, false)
  end
end
