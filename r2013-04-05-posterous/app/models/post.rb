# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  author     :string(255)
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  posted     :date
#

class Post < ActiveRecord::Base
  attr_accessible :title, :author, :body, :posted
end
