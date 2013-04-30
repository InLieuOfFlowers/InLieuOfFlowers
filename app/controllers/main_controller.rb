class MainController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to dashboard_path
  	end
  end

  def about
  end

  def contact
  end

  def help
  end

  def dashboard
    if !user_signed_in?
      redirect_to new_user_session_path
    else
      @honored = Honored.where("user_id = ? AND status != ?", current_user.id, "complete")
      
      @donation = Donation.where("user_id = ? AND created_at > ?", current_user.id,
          30.days.ago)
      if !@donation.blank?
        @donation_report = []
        amount = 0
        @donation.each do |donation|
          @honored = Honored.find(donation.honored_id)
          @donation_detail = DonationDetail.where("donation_id = ?",donation.id)
          if !@donation_detail.blank?
            @donation_detail.each do |donation_detail|
              amount += donation_detail.amount
            end
          end
          report = {donation_id: donation.id, donation_amout: amount,
            honored_first_name: @honored.first_name, 
            honored_last_name: @honored.last_name,
            date_created: donation.date_created}

          @donation_report.push(report)
        end
      end
    end
  end
end
