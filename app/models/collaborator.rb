class Collaborator < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
 	def self.selection
 		return [*1..15]
 	end
end