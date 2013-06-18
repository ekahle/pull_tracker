class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :timeoutable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
end
