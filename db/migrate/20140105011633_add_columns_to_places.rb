class AddColumnsToPlaces < ActiveRecord::Migration
  def up
  	add_column "places", "city", :string, :limit => 40
  	add_column "places", "country", :string, :limit => 40 
  	remove_column "places", "zip_code"
  	remove_column "places", "country_code"
  	change_column "places", "latitude", :float, :precision => 15, :decimals => 12 
  	change_column "places", "longitude", :float, :precision => 15, :decimals => 12

  end

  def down
   	remove_column "places", "latitude"
   	remove_column "places", "longitude"
    add_column  "places", "latitude", :decimal, :precision => 15, :scale => 10, :default => 0.0
    add_column  "places", "longitude", :decimal, :precision => 15, :scale => 10, :default => 0.0
  	add_column "places", "country_code", :string
    add_column "places", "zip_code", :string, :null => false
    remove_column "places", "city"
  	remove_column "places", "country"
  end
end
