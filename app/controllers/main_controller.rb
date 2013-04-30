class MainController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to dashboard_path
  	end
  end

  def about
  end

  def contact
  end

  def help
  end

  def dashboard
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      @honored = Honored.where("user_id = ? AND status != ?", current_user.id, "complete") 
    end
  end
end
