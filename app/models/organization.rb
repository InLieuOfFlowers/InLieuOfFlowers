# == Schema Information
#
# Table name: organizations
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  street       :string(255)
#  city         :string(255)
#  state        :string(255)
#  zip          :string(255)
#  phone        :string(255)
#  email        :string(255)
#  contact_name :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string(255)
#

class Organization < ActiveRecord::Base
  attr_accessible :city, :contact_name, :email, :name, :phone, :state, :street, :zip, :status
end
