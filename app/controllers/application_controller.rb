class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postcode, :address ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  
end
