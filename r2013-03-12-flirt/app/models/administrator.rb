# == Schema Information
#
# Table name: administrators
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  role       :string(255)
#  ssn        :string(255)
#  tel        :string(255)
#

class Administrator < ActiveRecord::Base
  attr_accessible :role, :ssn, :tel
  has_one :user, :as => :userable
  validates :role, :presence => true
end
