class Pull < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
