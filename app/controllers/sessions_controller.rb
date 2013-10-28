class SessionsController < ApplicationController
  include SessionsHelper
  
  def sign_in
    redirect_to '/auth/dbc'
  end

  def sign_out
    session.clear
    redirect_to root_path
  end

  def auth
    user_attributes = request.env['omniauth.auth'].info
    session[:user_attributes] = user_attributes
    token = request.env['omniauth.auth'].credentials
    user = User.from_auth(user_attributes)
    session[:oauth_token] = token_as_hash(token)
    
    redirect_to root_path
  end

end
