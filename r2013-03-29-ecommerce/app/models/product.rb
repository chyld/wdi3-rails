# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image       :text
#  cost        :decimal(, )      default(0.0)
#  lat         :float
#  lng         :float
#  address     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Product < ActiveRecord::Base
  attr_accessible :name, :description, :cost, :address, :image, :remote_image_url
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_and_belongs_to_many :tags

  scope :filtered, where('user_id is null').order(:name)

  before_save :geocode

  private

  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
      self.lat = result.latitude
      self.lng = result.longitude
    end
  end
end
