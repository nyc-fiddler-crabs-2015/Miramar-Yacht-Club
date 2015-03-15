class CreateEvents < ActiveRecord::Migration
	def change
	create_table :events do |t|
			t.integer :user_id, null: false
			t.string :title, null: false
			t.text :description, null: false 
			t.datetime :event_date, null: false  
			t.timestamps null: false 
		end
	end
end
