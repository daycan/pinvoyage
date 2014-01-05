class Card < ActiveRecord::Base

	belongs_to :place
	has_many :pins
	has_many :users, :through => :pins

	scope :newest_first, lambda { order("cards.created_at DESC")}
	scope :search, lambda {|query|
		where(["text LIKE ?", "%#{query}%"])
	}	

end
