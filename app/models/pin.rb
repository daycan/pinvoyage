class Pin < ActiveRecord::Base

	belongs_to :user
	belongs_to :card

	acts_as_list :scope => :user

	paginates_per 25

	# Define fields that Solr can use for search
	searchable do
    text :description
    text :full_street_address
    integer :user_id
    time    :created_at
    time    :updated_at
  end



	def full_street_address
		[card.text, card.place.name, card.place.city, card.place.country, card.place.location_type].compact.join(', ')
	end


end
