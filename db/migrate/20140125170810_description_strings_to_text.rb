class DescriptionStringsToText < ActiveRecord::Migration
  def up
  	change_column :cards, :text, :text
  	change_column :pins, :description, :text
  end
  
  def down
  	# This might cause trouble if you have strings longer
    # than 255 characters.
  	change_column :cards, :text, :string
  	change_column :pins, :description, :string
  end

end
