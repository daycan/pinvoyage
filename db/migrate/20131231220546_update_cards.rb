class UpdateCards < ActiveRecord::Migration
  def change
  	add_index("cards", "place_id")
  end
end
