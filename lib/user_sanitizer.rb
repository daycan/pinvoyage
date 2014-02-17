class User::ParameterSanitizer < Devise::ParameterSanitizer
   
   private
    def account_update
        default_params.permit(:avatar, :username, :email, :password, :password_confirmation, :current_password)
    end
end