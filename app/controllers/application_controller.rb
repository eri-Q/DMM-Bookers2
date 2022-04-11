class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
  end

  def after_sign_in_path_for(resource)
    if current_user
      flash[:notice] = "You are successfully logged in!"
      user_path(@user.id)
    else
      flash[:notice] = "You are successfully signed up!"
      user_path(@user.id)
    end
  end
end
