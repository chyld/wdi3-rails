# == Schema Information
#
# Table name: games
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  is_active      :boolean
#  current_player :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Game < ActiveRecord::Base
  attr_accessible :name, :is_active, :current_player
  has_and_belongs_to_many :users
end
