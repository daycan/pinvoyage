class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :zip_code, :null => false
      t.string "name", :limit => 50
      t.decimal  "latitude", :precision => 15, :scale => 10, :default => 0.0
      t.decimal  "longitude", :precision => 15, :scale => 10, :default => 0.0
      t.string :country_code
      t.timestamps
    end
  end
end
