class User < ActiveRecord::Base
  # has_secure_password
  has_many :events
  has_many :comments
  has_many :collaborators
end

