class Card < ActiveRecord::Base

	belongs_to :place
	has_many :pins

end
