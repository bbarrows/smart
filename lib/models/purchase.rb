class Purchase < ActiveRecord::Base
  has_many :orders
end

# == Schema Information
#
# Table name: purchases
#
#  id           :integer(4)      not null, primary key
#  ccnum        :string(255)
#  month        :string(255)
#  year         :string(255)
#  confirmation :string(255)
#  email        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

