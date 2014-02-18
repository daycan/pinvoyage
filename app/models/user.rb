class User < ActiveRecord::Base

	has_many :pins
	has_many :cards, :through => :pins

	has_attached_file :avatar, 
		:styles => { :medium => "300x300#", :thumb => "100x100#", :mini => "30x30#" }, 
		#:default_url => ActionController::Base.helpers.asset_path('avatar_blank_mini.png')
		:default_url => ActionController::Base.helpers.asset_path("assets/avatar_blank_:style.png", :digest => false)


  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
