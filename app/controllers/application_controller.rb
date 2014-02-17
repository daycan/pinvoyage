class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

	  # Overwriting the sign_out redirect path method
	  def after_sign_out_path_for(resource_or_scope)
	  	home_path = "/users/sign_up"
	  end

	  def after_inactive_sign_up_path_for(resource)
	    home_path = "/users/sign_up"
	  end

	protected

	  def devise_parameter_sanitizer
	    if resource_class == User
	      User::ParameterSanitizer.new(User, :user, params)
	    else
	      super # Use the default one
	    end
	  end

end
