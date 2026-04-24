class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
  end

  def require_admin!
    unless current_user&.admin?
      redirect_to root_path, alert: "Bạn không có quyền thực hiện thao tác này."
    end
  end
end
