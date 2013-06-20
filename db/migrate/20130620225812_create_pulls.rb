class CreatePulls < ActiveRecord::Migration
  def change
    create_table :pulls do |t|
      t.string :name
      t.string :status
      t.date :target_completion_date
      t.text :description
      t.string :file
      t.string :investigator
      t.string :requester
      t.string :pull_list_maker
      t.string :lab_contact_name
      t.text :notes_for_lab
      t.boolean :has_mta, default: false
      t.boolean :has_budget, default: false
      t.boolean :accepted_consent_to_long_term_storage, default: false
      t.boolean :accepted_emory_specimens, default: false
      t.boolean :accepted_cold_chain_quality, default: false
      t.boolean :accepted_specimen_quality, default: false

      t.timestamps
    end
  end
end
