# == Schema Information
#
# Table name: honoreds
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  date_of_birth :date
#  date_of_death :date
#  city          :string(255)
#  state         :string(255)
#  description   :string(255)
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Honored < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :date_ot_birth,
  	:date_of_death, :city, :state, :description, :user_id
end
