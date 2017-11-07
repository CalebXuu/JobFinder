class WelcomeController < ApplicationController

  # GET /welcome
  def index
    if current_new_user
      redirect_to posts_path
    end
  end

end
