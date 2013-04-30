class DonationDetailsController < ApplicationController
  def new
    @honored = Honored.find(params[:honored_id])
    @donation_id = params[:donation_id]
    @honored_organization = HonoredOrganization.where("honored_id = ?", @honored.id)

    @organization_report = []
    @honored_organization.each do |honored_organization|
      @organization = Organization.find(honored_organization.organization_id)

      org_report = {organization_id: @organization.id, 
        organization_name: @organization.name}
      @organization_report.push(org_report)
    end
  end

  def create
      
      don_id = 0
      params[:donation_detail].each do |key, value|        
        if key == "donation_id"
          don_id = value
        else
          @donation_detail = DonationDetail.new
          @donation_detail.donation_id = don_id
          @donation_detail.organization_id = key
          @donation_detail.amount = value[:amount]
          @donation_detail.save
        end
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
