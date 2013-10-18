class PullManifest < ActiveRecord::Base
  belongs_to :pull

  validates :pull_id, presence: true
end
