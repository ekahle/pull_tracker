class Pull < ActiveRecord::Base
  validates :pull_number, :name, presence: true, uniqueness: true
  validates :status, :description, :file, :requester, presence: true
  validates :pull_number, numericality: {greater_than_or_equal_to: 1.0}
end

