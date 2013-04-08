# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#

class Album < ActiveRecord::Base
  attr_accessible :name, :image
  has_many :songs
  belongs_to :artist
end
