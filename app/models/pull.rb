class Pull < ActiveRecord::Base
  has_many :pull_lists
  has_many :pull_manifests

  default_scope order('id DESC')

  validates :status, :description, :specimen_type, presence: true

  def name
    "Pull #{id}"
  end
end
