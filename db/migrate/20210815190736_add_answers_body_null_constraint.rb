class AddAnswersBodyNullConstraint < ActiveRecord::Migration
  def change
    change_column_null(:answers, :body, false)
  end
end
