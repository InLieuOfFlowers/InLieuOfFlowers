class DonationsController < ApplicationController
  def new
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @honored = Honored.find(params[:honored_id])
  end

  def create
    @donation = Donation.new
    @honored = Honored.find(params[:honored_id])
    @donation.honored_id = @honored.id
    @donation.user_id = current_user.id
    @donation.save

    redirect_to new_donation_detail_path(honored_id: @honored.id, donation_id: @donation.id)
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @donation = Donation.all

     @donation_reciept_array = []
    if !@donation.blank?
      @donation.each do |donation|
        @donation_detail  = DonationDetail.where("donation_id = ?", donation.id)

        if !@donation_detail.blank?
          @donation_honored = Honored.find(donation.honored_id)
        
          honored_name = @donation_honored.first_name + " " + @donation_honored.last_name
        
          donation_reciept = {donation_id: donation.id,
            honored_name: honored_name, 
            donation_date: donation.created_at.to_time.strftime('%B %A %Y') }

          @donation_reciept_array << donation_reciept
        end
      end
    end
  end

  def show
    if params[:id].blank?      
      redirect_to dashboard_path
    end

    @donation = Donation.find(params[:id])

    if @donation.blank?
      redirect_to dashboard_path
    end
    @user = User.find(@donation.user_id)

    @donation_detail = DonationDetail.where("donation_id = ?", "#{@donation.id}")

    if @donation_detail.blank?
      flash[:notice] = "Donation number " + 
        @donation.id + " does not contain donation information"

      redirect_to donations_path
    end

    @donation_total = 0
    @donation_reciept_array = []

    @donation_detail.each do |detail|
        @organization = Organization.find(detail.organization_id)

        donation_reciept = {
          organization_name: @organization.name,
          amount: detail.amount
        }

        @donation_reciept_array << donation_reciept        
            
        @donation_total += detail.amount
    end
  end
end
