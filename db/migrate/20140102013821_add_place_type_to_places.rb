class AddPlaceTypeToPlaces < ActiveRecord::Migration
  def change
  	add_column("places", "location_type", :string, :after => "name")
  end
end
