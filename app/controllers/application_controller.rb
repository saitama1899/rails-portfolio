class ApplicationController < ActionController::Base

    before_filter :configure_permitted_params, if: :devise_controller? 
    
    def configure_permitted_params
        devise_parameter_sanitizer.permit(:sign_up, key: [:name])
        devise_parameter_sanitizer.permit(:account_update, key: [:name])
    end 
end
