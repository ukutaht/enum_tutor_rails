module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by_socrates_id(session[:user_attributes].id)
  end

  def authenticated?
    !current_user.nil?
  end
  
  def token_as_hash(token)
  { token: token.token,
    refresh_token: token.refresh_token,
    expires_at: token.expires_at }
  end
  
end
