class AddSpecimenTypeToPulls < ActiveRecord::Migration
  def change
    add_column :pulls, :specimen_type, :string
  end
end
