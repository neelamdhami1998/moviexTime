class ApplicationController < ActionController::Base
   

	def after_sign_in_path_for(resource)		
        if current_marchant
            marchant_users_path
        else
        	root_path
        end 
     end      
    before_action :configure_permitted_parameters, if: :devise_controller?
protected
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_no])
	end
end 
