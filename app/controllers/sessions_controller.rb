class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    user = User.where(
      uid: auth_hash['uid']
    ).first || User.create_with_omniauth(auth_hash)

    user.generate_token!

    cookies[:token] = user.token
    redirect_to root_url, notice: 'Signed in!'
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'Signed out!'
  end

  def failure
    redirect_to root_url, alert: "Authentication error: #{params[:message].humanize}"
  end

protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
