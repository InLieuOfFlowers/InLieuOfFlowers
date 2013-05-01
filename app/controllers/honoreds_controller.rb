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

  def edit
    if user_signed_in?
      if params.has_key?(:id)
        @honored = Honored.find(params[:id])

        if current_user.id != @honored.user_id
          if current_user.administrator?
            redirect_to @honored
          end
        end
      end
    end
  end

  def update  
    @honored = Honored.find(params[:id])

    if @honored.update_attributes(params[:honored])
      redirect_to @honored
    else
      render 'edit'
    end
  end

  def destroy
    Honored.destroy(params[:id])
    redirect_to dashboard_path
  end

  def index
    @honored = Honored.paginate(page: params[:page])
  end

  def show
    @honored = Honored.find(params[:id])
  end
end
