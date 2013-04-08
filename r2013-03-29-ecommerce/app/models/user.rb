# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#  balance         :decimal(, )      default(0.0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :balance
  has_secure_password
  has_many :products
end
