class PullList < ActiveRecord::Base
  belongs_to :pull

  validates :pull_id, :file, presence: true
end
