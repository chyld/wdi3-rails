# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  image      :string(255)
#  filename   :string(255)
#  album_id   :integer
#  artist_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cost       :decimal(, )
#

class Song < ActiveRecord::Base
  attr_accessible :name, :image, :filename, :cost, :genre_ids
  belongs_to :album, :inverse_of => :songs
  belongs_to :artist, :inverse_of => :songs
  has_and_belongs_to_many :mixtapes
  has_and_belongs_to_many :genres
  validates :name, :filename, :presence => true
  validates :cost, :numericality => {:greater_than_or_equal_to => 0}
end
