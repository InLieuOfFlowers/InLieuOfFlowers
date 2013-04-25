class HonoredOrganizationsController < ApplicationController
  def new
    @organization = Organization.all
    @honored_organization = HonoredOrganization.new
    @organization_id = []
  end

  def create
    
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
  end
end
