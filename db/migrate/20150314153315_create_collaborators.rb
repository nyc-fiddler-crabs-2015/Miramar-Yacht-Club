class CreateCollaborators < ActiveRecord::Migration
	def change
		create_table :collaborators do |t|
			t.integer :user_id, null: false
			t.integer :event_id, null: false
			t.integer :guest_num, null: false 	
		end
	end
end
