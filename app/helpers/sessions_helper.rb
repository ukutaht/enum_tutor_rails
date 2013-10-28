module SessionsHelper
  
  def current_user
    # @current_user ||= User.find_by_socrates_id(session[:user_attributes].id)
  end

  def authenticated?
    !current_user.nil?
  end

end
