# == Schema Information
#
# Table name: stories
#
#  id         :integer          not null, primary key
#  title      :text
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Story < ActiveRecord::Base
  attr_accessible :title, :url
end
