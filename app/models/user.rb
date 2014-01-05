class User < ActiveRecord::Base

	has_secure_password

	has_many :pins
	has_many :cards, :through => :pins

	scope :sorted, lambda { order("last_name ASC, first_name ASC")}
	scope :newest_first, lambda { order("user.created_at DESC")}
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}	

	def name
		"#{first_name} #{last_name}"
	end

end
