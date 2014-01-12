class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string "name", :limit => 50
      t.string "location_type"
      t.string "city", :limit => 50
      t.string "country", :limit => 50
      t.timestamps
      t.string "service"
      t.string "service_id"
    end
    add_index("places", "name")
  end
end



