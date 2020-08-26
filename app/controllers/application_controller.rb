class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_sign_up_params, only: [:create]
  protected 
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :address, :address_number,
      :address_complement, :city, :country, :zip_code, :phone, :remember_me])
  end
end
