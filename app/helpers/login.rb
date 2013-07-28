
helpers do
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    session[:user_id] = user.id
    session[:type] = user.type
  end

  def therapist?
    session[:type] == 'Therapist'
  end

  def patient?
    session[:type] == 'Patient'
  end

  def admin?
    session[:type] == 'Admin'
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.clear
  end
  
end