class OrganizationsController < ApplicationController
  def new
    if user_signed_in?
      @organization = Organization.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @organization = Organization.new(params[:organization])
      @organization.status = 'pending'

      if @organization.save
        redirect_to @organization
      else
        render 'new'
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in?
      if params[:id]
        @organization = Organization.find(params[:id])
      end
    else
      redirect_to new_user_session_path
    end
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
  end
end
