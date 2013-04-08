# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  duedate     :date
#  is_complete :boolean          default(FALSE)
#  user_id     :integer
#  priority_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  address     :text
#  latitude    :float            default(0.0)
#  longitude   :float            default(0.0)
#

class Task < ActiveRecord::Base
  attr_accessible :title, :description, :duedate, :is_complete, :address, :priority_id
  belongs_to :user, :inverse_of => :tasks
  belongs_to :priority, :inverse_of => :tasks

  before_save :geocode
  private
  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
      self.latitude = result.latitude
      self.longitude = result.longitude
    end
  end
end
