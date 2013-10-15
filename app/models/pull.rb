class Pull < ActiveRecord::Base
  has_many :pull_lists
  #validates :pull_number, :name, presence: true, uniqueness: true
  validates :status, :description, :specimen_type, presence: true
end

