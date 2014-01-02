class AddIndexes < ActiveRecord::Migration
  def change
  	add_index("places", "name")
  	add_index("places", "country_code")
  	add_index("users", "email")
  end
end
