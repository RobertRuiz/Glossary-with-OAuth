class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def logged_in?
   !!current_user
 end
 helper_method :logged_in?

 # Method to use in filter to ensure the user is logged in
 def authenticate!
   unless logged_in?
     redirect_to login_path
   end
 end

 # Assign the current user
 def current_user=(user)
   session[:user_id] = user.id
 end

end




# # Returns the current use if logged in
# def current_user
#   # if session[:user_id]
#   #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
#   # end
# end
# helper_method :current_user
#
# # Returns a boolean representing if the user is logged in
# def logged_in?
#   !!current_user
# end
# helper_method :logged_in?
#
# # Method to use in a filter to ensure the user is logged in
# def authorize!
#   redirect_to login_path unless logged_in?
# end
#
# # Assign the current user
# def current_user=(user)
#   session[:user_id] = user.id
# end
