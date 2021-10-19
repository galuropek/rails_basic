class AddTimerToTests < ActiveRecord::Migration
  def change
    add_column :tests, :timer, :time
  end
end
