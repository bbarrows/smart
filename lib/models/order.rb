class Order < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchase
end

# == Schema Information
#
# Table name: orders
#
#  id          :integer(4)      not null, primary key
#  beer_id     :integer(4)
#  purchase_id :integer(4)
#  quantity    :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

