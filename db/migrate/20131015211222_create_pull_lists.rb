class CreatePullLists < ActiveRecord::Migration
  def change
    create_table :pull_lists do |t|
      t.string :file

      t.timestamps
    end
  end
end
