class OrganizationsController < ApplicationController
  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(params[:organization])
    @organization.status = 'pending'
    @organization.save
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
