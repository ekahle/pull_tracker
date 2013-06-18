class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :timeoutable, :trackable, :validatable
end
