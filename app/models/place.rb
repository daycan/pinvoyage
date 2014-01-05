class Place < ActiveRecord::Base

	has_many :cards
	accepts_nested_attributes_for :cards
	attr_accessor :text

	#geocoder configuration
	geocoded_by :full_street_address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
	# reverse_geocoded_by :latitude, :longitude
	# after_validation :reverse_geocode  # auto-fetch address

	#sorting 
	scope :restaurant, lambda { where(:location_type => "Restaurant")}
	scope :bar, lambda { where(:location_type => "Bar")}
	scope :site, lambda { where(:location_type => "Site")}
	scope :shop, lambda { where(:location_type => "Shop")}

	scope :sorted, lambda { order("places.name ASC")}
	scope :newest_first, lambda { order("subjects.created_at DESC")}
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}	

	def full_street_address
		name + ", " + city + ", " + country
	end

end
