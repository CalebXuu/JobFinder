module SessionsHelper

	# Logs in the given user.
	def log_in(user)
	   session[:user_id] = user.id
	end

	# Returns the current logged-in user (if any).
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

  def logged_in?
     !current_user.nil?
  end

	def require_user
		redirect_to '/login' unless current_user
	end

	def require_admin
		redirect_to '/' unless current_user.email == "admin@email.com"
	end

  def display_notice_and_alert
    msg = ''
    msg << (content_tag :div, notice, :class => "notice") if notice
    msg << (content_tag :div, alert, :class => "alert") if alert
    sanitize msg
  end


  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
