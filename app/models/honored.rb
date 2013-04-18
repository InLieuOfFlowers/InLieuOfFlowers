# == Schema Information
#
# Table name: honoreds
#
#  id            :integer          not null, primary key
#  first_name    :string(255)      not null
#  last_name     :string(255)      not null
#  date_of_birth :date
#  date_of_death :date
#  city          :string(255)
#  state         :string(255)
#  description   :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status        :string(255)      default("pending"), not null
#

class Honored < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :date_of_birth,
  	:date_of_death, :city, :state, :description, :user_id, :status

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :status, presence: true
end
