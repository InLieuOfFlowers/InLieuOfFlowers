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

      if !@organization.save
        render 'new'
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in?
      @organization = Organization.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      redirect_to @organization
    end
  end

  def destroy
    Organization.find(params[:id]).destroy
  end

  def index
    @organization = Organization.paginate(page: params[:page], :per_page => 30)
  end

  def show
    @organization = Organization.find(params[:id])
  end
end
