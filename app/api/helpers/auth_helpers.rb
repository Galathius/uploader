module Helpers::AuthHelpers
  extend Grape::API::Helpers

  class Unauthorized < StandardError; end

  def authenticate!
    raise Unauthorized unless current_user
  end

  def current_user
    @current_user ||= User.find_by(token: current_access_token)
  end

protected
  def current_access_token
    params[:token] || cookies[:token]
  end
end
