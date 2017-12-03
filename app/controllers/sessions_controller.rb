class SessionsController < ApplicationController
  # before_action :save_login_state, :only => [:create, :login_attempt]
  # before_action :authenticate_user, :only => [:logout]


  def new
  end

  # POST /sessions/login
  def create
    user = User.find_by_email(params[:session][:email])
   if user && user.authenticate(params[:session][:password])
     session[:user_id] = user.id
     redirect_to '/welcome'
   else
     flash.now[:danger] = 'Invalid email/password combination'
     redirect_to '/login'
   end
  end

  # GET /sessions/logout
  def destroy
    log_out
    redirect_to 'welcome#index'
    # redirect_to '/'
  end

end
