class UsersController < ApplicationController

  # layout false

  before_action :require_user, :require_admin, only: [:admin, :destroy]
  before_action :require_admin,     only: :destroy
  skip_before_filter :verify_authenticity_token, :only => :destroy

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Job App!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "Form is invalid"
      redirect_to '/signup'
    end
  end

  def admin
    @user = User.all
  end

  def edit
   @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Edit updated"
      # redirect_to '/admin'
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    # redirect_to '/admin'
  end


  # # GET /users/:id/profile
  # def profile
  #   if (session[:user_id].to_s != params[:id])
  #     redirect_to(:controller => 'users', :action => 'profile', :id => session[:user_id])
  #   else
  #     render "profile"
  #   end
  # end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
