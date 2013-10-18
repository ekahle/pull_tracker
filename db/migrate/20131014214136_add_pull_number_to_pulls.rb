class AddPullNumberToPulls < ActiveRecord::Migration
  def change
    add_column :pulls, :pull_number, :decimal
  end
end
