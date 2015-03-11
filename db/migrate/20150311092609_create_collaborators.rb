class CreateCollaborators < ActiveRecord::Migration
	def change
		create_table :collaborators do |t|
			t.references :user, null: false
			t.references :event, null: false
			t.integer :guest_num, null: false 	
		end
	end
end
