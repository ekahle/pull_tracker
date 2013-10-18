class CreatePullManifests < ActiveRecord::Migration
  def change
    create_table :pull_manifests do |t|
      t.string :file

      t.timestamps
    end
  end
end
