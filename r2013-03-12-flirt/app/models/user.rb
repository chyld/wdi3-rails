# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  userable_id     :integer
#  userable_type   :string(255)
#

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :username, :email, :password, :password_confirmation
  belongs_to :userable, :polymorphic => true
  validates :username, :email, :presence => true

  def sub
    self.userable if self.userable.is_a?(Subscriber)
  end

  def admin
    self.userable if self.userable.is_a?(Administrator)
  end
end
