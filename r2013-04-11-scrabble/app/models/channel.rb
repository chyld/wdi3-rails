# == Schema Information
#
# Table name: channels
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Channel < ActiveRecord::Base
  attr_accessible :name
end
