class Pull < ActiveRecord::Base
  has_many :pull_lists
  has_many :pull_manifests
  #validates :pull_number, :name, presence: true, uniqueness: true
  validates :status, :description, :specimen_type, presence: true
end

