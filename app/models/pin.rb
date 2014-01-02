class Pin < ActiveRecord::Base

	belong_to :user
	belong_to :card

end
