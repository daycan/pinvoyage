module FormHelper
	def setup_place(place)
		place.card = Card.new
		place
	end
end