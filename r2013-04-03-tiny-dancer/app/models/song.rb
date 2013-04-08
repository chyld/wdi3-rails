# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  position   :integer
#  filename   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#

class Song < ActiveRecord::Base
  attr_accessible :name, :position, :filename
  belongs_to :album
end
