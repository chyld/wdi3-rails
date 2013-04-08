# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  attr_accessible :name, :image, :song_ids
  has_many :songs, :inverse_of => :album
  has_many :artists, :through => :songs
  has_and_belongs_to_many :users
  validates :name, :presence => true

  def cost(purchased_songs)
    (songs.map(&:cost).inject(&:+) || 0) - (purchased_songs.select{|s| s.in?(songs)}.map(&:cost).inject(&:+) || 0)
  end
end
