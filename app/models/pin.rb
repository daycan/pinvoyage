class Pin < ActiveRecord::Base

	belongs_to :user
	belongs_to :card

	acts_as_list :scope => :user

end
