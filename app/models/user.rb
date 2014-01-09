 class User < ActiveRecord::Base

	has_secure_password

	has_many :pins
	has_many :cards, :through => :pins

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
	validates_presence_of :email
	validates_length_of :email, :maximum => 100
	validates_format_of :email, :with => EMAIL_REGEX
	validates_uniqueness_of :email
	validates_confirmation_of :email
	validates_confirmation_of :password
	validates_uniqueness_of :username, :allow_blank => true
	validates_length_of :first_name, :maximum => 25
	validates_length_of :last_name, :maximum => 50
	validates_length_of :username, :maximum => 25


	scope :sorted, lambda { order("last_name ASC, first_name ASC")}
	scope :newest_first, lambda { order("user.created_at DESC")}
	scope :search, lambda {|query|
		where(["name LIKE ?", "%#{query}%"])
	}	

	def name
		"#{first_name} #{last_name}"
	end

end
