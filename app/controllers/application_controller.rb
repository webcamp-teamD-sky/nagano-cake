class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?



protected

  def configure_permitted_parameters
    added_attrs = [ :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postcode, :address ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end


  def after_sign_in_path_for(resource_or_scope)
    customers_mypage_path
  end
  
  

private
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end



end
