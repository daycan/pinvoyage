class Place < ActiveRecord::Base

	has_many :cards

	scope :restaurant, lambda { where(:location_type => "Restaurant")}
	scope :bar, lambda { where(:location_type => "Bar")}
	scope :site, lambda { where(:location_type => "Site")}
	scope :shop, lambda { where(:location_type => "Shop")}

	scope :sorted, lambda { order("places.name ASC")}
	scope :newest_first, lambda { order("subjects.created_at DESC")}
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}	
end
