# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  row        :integer
#  col        :integer
#  flight_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Reservation < ActiveRecord::Base
  attr_accessible :row, :col, :flight_id, :user_id
  belongs_to :user
  belongs_to :flight
end
