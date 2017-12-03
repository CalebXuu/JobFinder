class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  before_action :current_user
  include SessionsHelper
  # protected
  # def save_login_state
  #   if session[:user_id]
  #     redirect_to(:controller => 'users', :action => 'profile', :id => session[:user_id])
  #     return false
  #   else
  #     return true
  #   end
  # end
  #
  # protected
  # def authenticate_user
  #   redirect_to(:controller => 'sessions', :action => 'new') unless @current_user.present?
  # end
  #
  # protected
  # def current_user
  #   if session[:user_id]
  #     # set current user object to @current_user object variable
  #     @current_user = User.find session[:user_id]
  #     true
  #   end
  #   false
  # end


end
