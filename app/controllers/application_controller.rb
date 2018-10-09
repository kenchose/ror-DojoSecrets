class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  private
    #check if current_user is logged in.
    def logged_in
      current_user != nil
    end

    def require_login
      unless logged_in #if user is not logged in
        flash[:errors] = ["Must be logged in"]
        redirect_to new_session_path
      end
    end
end
