class HonoredsController < ApplicationController
  def new
    if user_signed_in?
      @honored = Honored.new
    else
      redirect_to about_path
    end
  end

  def create
    @honored = Honored.new(params[:honored])
    @honored.user_id = current_user.id
    if @honored.save
      redirect_to @honored
    else
      render 'new'
    end
 
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
    @honored = Honored.find(params[:id])
  end
end
