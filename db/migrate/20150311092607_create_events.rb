class CreateEvents < ActiveRecord::Migration
	def change
	create_table :events do |t|
			t.references :user, null: false
			t.string :title, null: false
			t.string :description, null: false 
			t.datetime :event_date, null: false  
			t.timestamps null: false 
		end
	end
end
