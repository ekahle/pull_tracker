class AddDetailsToPulls < ActiveRecord::Migration
  def change
    add_column :pulls, :study, :string
    add_column :pulls, :participant_type, :string
    add_column :pulls, :visit_type, :string
    add_column :pulls, :specimen_count, :integer
    add_column :pulls, :scanned_count, :integer
    add_column :pulls, :shipped_count, :integer
    add_column :pulls, :not_found_count, :integer
    add_column :pulls, :hold, :boolean
    add_column :pulls, :repository_notes, :text
    add_column :pulls, :lab, :string
    add_column :pulls, :mta_number, :string
    add_column :pulls, :procedure, :string
  end
end
