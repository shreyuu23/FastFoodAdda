class ApplicationController < ActionController::Base
	

  	before_action :authenticate_user!
before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters    # Permit the subscribe_newsletter parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
  end
   
  private

  def after_sign_in_path_for(resource)
		if User::USER_ROLES.invert[resource.role_id] == "Admin"
			admin_path
		elsif User::USER_ROLES.invert[resource.role_id] == "User"
			 root_path
          else User::USER_ROLES.invert[resource.role_id] == "Resto"
           resto_path
      		end
        
  end
end
