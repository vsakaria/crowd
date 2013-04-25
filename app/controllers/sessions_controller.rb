class SessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    authentication = Authentication.find_or_create_from_auth_hash(auth_hash)
    self.current_user = authentication.user
    redirect_to root_url
  end

  def destroy
    self.current_user = nil
    redirect_to root_url
  end

  def failure
    flash[:error] = "Access was not granted, you are not logged in."
    redirect_to root_url
  end
end