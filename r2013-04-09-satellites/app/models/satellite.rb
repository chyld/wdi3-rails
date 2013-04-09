# == Schema Information
#
# Table name: satellites
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  period     :float
#  diameter   :float
#  distance   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  planet_id  :integer
#

class Satellite < ActiveRecord::Base
  attr_accessible :name, :image, :period, :diameter, :distance, :planet_id
  belongs_to :planet
end
