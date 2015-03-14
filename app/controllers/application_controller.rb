class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?

private

  def current_user
    token = cookies[:token]
    @current_user ||= User.find_by(token: token) if token.present?
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    unless current_user
      redirect_to root_url, :alert => 'You need to sign in for access to this page.'
    end
  end

end
