class Pull < ActiveRecord::Base
  has_many :pull_lists
  has_many :pull_manifests
  default_scope order('id DESC')
  #validates :pull_number, :name, presence: true, uniqueness: true
  validates :status, :description, :specimen_type, presence: true
end
