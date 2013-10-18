class AddPullIdToPullManifests < ActiveRecord::Migration
  def change
    add_column :pull_manifests, :pull_id, :integer
  end
end
