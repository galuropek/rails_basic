class AddAnswersCorrectSetDefaultValue < ActiveRecord::Migration
  def change
    change_column_default(:answers, :correct, false)
  end
end
