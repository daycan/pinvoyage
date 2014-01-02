class UpdatePins < ActiveRecord::Migration
  
 def change
	change_table :pins do |t|
	  t.references :card
	  t.references :user
	  t.string :description
	end
    add_index :pins, ["card_id", "user_id"]
  end
end
