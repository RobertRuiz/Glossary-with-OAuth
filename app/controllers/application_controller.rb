class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

class ApplicationController < ActionController::Base
  # Returns the current use if logged in
  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
      # if session[:expires_at] && session[:expires_at] < Time.now
      #   session[:expires_at] = 1.hour.from_now
      # end
    end
  end
  helper_method :current_user

  # Returns a boolean representing if the user is logged in
  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  # Method to use in a filter to ensure the user is logged in
  def authorize!
    redirect_to login_path unless logged_in?
  end
end
