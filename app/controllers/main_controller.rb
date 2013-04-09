class MainController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to about_path
  	end
  end

  def about
  end

  def contact
  end

  def help
  end
end
