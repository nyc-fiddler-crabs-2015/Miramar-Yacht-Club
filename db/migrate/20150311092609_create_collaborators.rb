class CreateCollaborators < ActiveRecord::Migration
	def change
		create_table :collaborators do |t|
			t.references :user, null: false
			t.references :user, null: false
			t.integer :description, null: false 	
		end
	end
end
