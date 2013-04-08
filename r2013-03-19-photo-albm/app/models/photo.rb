# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  album_id   :integer
#

class Photo < ActiveRecord::Base
  attr_accessible :name, :url, :remote_url_url
  belongs_to :album
  mount_uploader :url, PicUploader
end
