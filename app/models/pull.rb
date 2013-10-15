class Pull < ActiveRecord::Base
  #validates :pull_number, :name, presence: true, uniqueness: true
  validates :status, :description, :specimen_type, presence: true
end

