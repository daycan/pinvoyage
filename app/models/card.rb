class Card < ActiveRecord::Base

	belongs_to :place
	has_many :pins
	has_many :users, :through => :pins
	accepts_nested_attributes_for :place

	has_attached_file :card_image, :styles => { :large => "900x", :medium => "300x", :thumb => "100x"}

	scope :newest_first, lambda { order("cards.created_at DESC")}
	scope :search, lambda {|query|
		where(["text LIKE ?", "%#{query}%"])
	}	

end
