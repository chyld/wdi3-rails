# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  plan       :string(255)
#  duration   :integer
#  cost       :decimal(, )
#  num_photos :integer
#  num_emails :integer
#  num_texts  :integer
#  is_alist   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ActiveRecord::Base
  attr_accessible :plan, :duration, :cost, :num_photos, :num_emails, :num_texts, :is_alist
  has_many :subscribers
end
