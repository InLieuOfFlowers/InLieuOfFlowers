class HonoredOrganizationsController < ApplicationController
  def new
    @honored = Honored.find(params[:id])
    organization_id = HonoredOrganization.where("honored_id = ?", @honored.id).select(:organization_id).pluck(:id)
    @organization = Organization.where("id NOT IN (?)", organization_id).
                                 paginate(page: params[:page], :per_page => 30)
    @honored_organization = HonoredOrganization.new
  end

  def create    
    if params.has_key?(:id_checkbox) && !params[:id_checkbox].blank?  
      params[:id_checkbox].each do |check|
        if HonoredOrganization.where("organization_id = ?", check).
                               where("honored_id = ?", params[:honored_id]).
                               blank?
          @honored_organization = HonoredOrganization.new
          @honored_organization.honored_id = params[:honored_id]
          @honored_organization.organization_id = check
          @honored_organization.save
        end
      end  
    end

    @honored_organization = HonoredOrganization.where("honored_id = ?", params[:honored_id])

    @organization_names = []

    @honored_organization.each do |honored_organization|
      @organization = Organization.find(honored_organization.organization_id)
      @organization_names << @organization.name
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
  end
end
