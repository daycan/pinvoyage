class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
    	t.references :card
		  t.references :user
		  t.string :description
      t.timestamps
      t.integer :position
    end
    add_index :pins, ["card_id", "user_id"]
  end
end
