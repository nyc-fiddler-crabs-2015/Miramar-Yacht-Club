class Event < ActiveRecord::Base
	has_many :comments
	has_many :collaborators
	belongs_to :user
end