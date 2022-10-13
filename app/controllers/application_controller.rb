class ApplicationController < ActionController::Base
  include Pundit::Authorization
  # before_action :configure_permitted_parameters, if: :devise_controller?
  #
  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_back(fallback_location: root_path)
  # end
  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    if policy_name == "user_policy"
        flash[:alert] = "sry ! U cant #{exception.query} this user "
    elsif policy_name == "post_policy"
      flash[:alert] = "sry ! U cant #{exception.query} this post "
    else
      flash[:alert] = "You are not authorized to perform this action."
    end
    redirect_back(fallback_location: root_path)
  end

end
