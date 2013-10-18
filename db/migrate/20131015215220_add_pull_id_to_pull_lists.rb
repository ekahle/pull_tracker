class AddPullIdToPullLists < ActiveRecord::Migration
  def change
    add_column :pull_lists, :pull_id, :integer
  end
end
