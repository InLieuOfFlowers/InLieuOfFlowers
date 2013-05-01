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
  end

  def show
  end
end
