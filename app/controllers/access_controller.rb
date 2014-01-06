class AccessController < ApplicationController

  layout :determine_layout

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def index
  	# display text & links
  end

  def login
  	# login form
  end

  def attempt_login
  	if params[:email].present? && params[:password].present?
  		found_user = User.where(:email => params[:email]).first
  		if found_user
  			authorized_user = found_user.authenticate(params[:password])
  		end
  	end

	  if authorized_user
	  	#mark user as logged in
	  	session[:user_id] = authorized_user.id
	  	session[:username] = authorized_user.username
	  	session[:email] = authorized_user.email
	  	flash[:notice] = "you are now logged in."
	  	redirect_to(:controller => 'pins')
	  else
	  	flash[:notice] = "Invalid username/password combination."
	  	redirect_to(:action => 'login')
	  end
	end

  def logout
  	# mark user as logged out
		session[:user_id] = nil
  	session[:username] = nil
  	session[:email] = nil
  	flash[:notice] = "Logged Out"
  	redirect_to(:action => "login")
  end

end
