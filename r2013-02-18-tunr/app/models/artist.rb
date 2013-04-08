# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ActiveRecord::Base
  attr_accessible :name, :image, :song_ids
  has_many :songs, :inverse_of => :artist
  has_many :albums, :through => :songs
  validates :name, :uniqueness => true, :presence => true
end
