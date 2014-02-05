class AddDefaultsToLatLng < ActiveRecord::Migration
  def up
  	change_column :places, :latitude, :string, :default => "0.0", :null => false
  	change_column :places, :longitude, :string, :default => "0.0", :null => false
  end

  def down
  	change_column :places, :latitude, :string, :null => true
  	change_column :places, :longitude, :string, :null => true
  end
end
