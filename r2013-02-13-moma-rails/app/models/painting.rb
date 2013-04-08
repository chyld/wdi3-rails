# == Schema Information
#
# Table name: paintings
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  year       :string(255)
#  medium     :string(255)
#  style      :string(255)
#  image      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#

class Painting < ActiveRecord::Base
  attr_accessible :title, :year, :medium, :style, :image, :artist_id
  belongs_to :artist
end
