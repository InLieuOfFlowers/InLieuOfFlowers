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
      if params.has_key?(:id)
        if @organization = Organization.find(params[:id])
          if !current_user.administrator?
            if @organization.status != 'Pending'
              if current_user.id != @organization.user_id
                redirect_to @organization
              end
            end
          end  
        end
        redirect_to dashboard_path
      end
      redirect_to dashboard_path
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
  end

  def index
    @organization = Organization.paginate(page: params[:page])
  end

  def show
  end
end
