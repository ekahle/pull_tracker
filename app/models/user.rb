class User < ActiveRecord::Base
  devise :database_authenticatable, :timeoutable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
