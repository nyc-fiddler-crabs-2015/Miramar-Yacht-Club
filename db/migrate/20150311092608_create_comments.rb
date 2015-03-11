class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.references :user, null: false
			t.references :event, null: false
			t.text :content, null: false 
			t.timestamps null: false 
		end
	end
end
