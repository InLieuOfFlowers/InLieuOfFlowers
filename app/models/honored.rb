# == Schema Information
#
# Table name: honoreds
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Honored < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :user_id
end
