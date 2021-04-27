class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def cities
  #   render json: CS.cities(params[:state], :IN).to_json
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone, :email])
    # devise_parameter_sanitizer.permit(:sign_in, keys: [:username, :email, :phone, :password])
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :phone)}
  end
end
