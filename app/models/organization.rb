# == Schema Information
#
# Table name: organizations
#
#  id           :integer          not null, primary key
#  name         :string(255)      default(""), not null
#  street       :string(255)      default(""), not null
#  city         :string(255)      default(""), not null
#  state        :string(255)      default(""), not null
#  zip          :string(255)      default(""), not null
#  phone        :string(255)      default(""), not null
#  email        :string(255)      default(""), not null
#  contact_name :string(255)      default(""), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :string(255)      default("pending"), not null
#

class Organization < ActiveRecord::Base
  attr_accessible :city, :contact_name, :email, :name, :phone, :state, :street, :zip, :status

  before_save { |user| user.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :city, presence: true
  validates :contact_name, presence: true
  validates :name, presence: true
  validates :phone, presence: true, length: { maximum: 10 }
  validates :state, presence: true, length: { maximum: 2 }
  validates :street, presence: true
  validates :zip, presence: true
  validates :status, presence: true 
end
