class Place < ActiveRecord::Base

	has_many :cards
	accepts_nested_attributes_for :cards
	
	#validates_presence_of :country
	validates_length_of :name, :maximum => 50
	validates_length_of :city, :maximum => 40
	validates_length_of :country, :maximum => 40


	attr_accessor :text

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
		[name, city, country].compact.join(', ')
	end

	def get_foursquare_lat_long
		client = Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_CLIENT_ID'], :client_secret => ENV['FOURSQUARE_CLIENT_SECRET'])
		tempVenue = client.search_venues(near: 'San Francisco, CA', query: "Red's Java")["groups"][0]["items"][0]
		tempVenueLat = tempVenue["location"]["lat"]
		tempVenueLng = tempVenue["location"]["lng"]
		tempVenueId = tempVenue["id"]
	end
	
end
