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
    user = User.from_auth(user_attributes)
    session[:user_socrates_id] = user.socrates_id

    redirect_to challenges_path
  end

end
