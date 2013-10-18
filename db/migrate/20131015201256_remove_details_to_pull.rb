class RemoveDetailsToPull < ActiveRecord::Migration
  def change
    remove_column :pulls, :pull_number, :decimal
    remove_column :pulls, :updated_at, :datetime
    remove_column :pulls, :created_at, :datetime
    remove_column :pulls, :accepted_specimen_quality, :boolean
    remove_column :pulls, :accepted_cold_chain_quality, :boolean
    remove_column :pulls, :accepted_emory_specimens, :boolean
    remove_column :pulls, :accepted_consent_to_long_term_storage, :boolean
    remove_column :pulls, :has_budget, :boolean
    remove_column :pulls, :has_mta, :boolean
    remove_column :pulls, :notes_for_lab, :text
    remove_column :pulls, :pull_list_maker, :string
    remove_column :pulls, :requester, :string
    remove_column :pulls, :investigator, :string
    remove_column :pulls, :file, :string
    remove_column :pulls, :name, :string
  end
end
