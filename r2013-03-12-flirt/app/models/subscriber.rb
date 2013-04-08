# == Schema Information
#
# Table name: subscribers
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  tagline         :string(255)
#  bio             :string(255)
#  preferences     :string(255)
#  bodytype        :string(255)
#  location        :string(255)
#  status          :string(255)
#  ethnicity       :string(255)
#  gender          :string(255)
#  age             :integer
#  occupation      :string(255)
#  interests       :string(255)
#  political       :string(255)
#  religious       :string(255)
#  education       :string(255)
#  income          :decimal(, )
#  subscription_id :integer
#  expires         :date
#

class Subscriber < ActiveRecord::Base
  attr_accessible :tagline, :bio, :preferences, :bodytype, :location, :status, :ethnicity, :gender, :age, :occupation, :interests, :political, :religious, :education, :income
  has_one :user, :as => :userable
  belongs_to :subscription
  validates :tagline, :bio, :gender, :presence => true
  validates :age, :numericality => {:greater_than => 17}

  def has_subscription?
    self.subscription.present?
  end

  def purchase_plan(name)
    plan = Subscription.where(:plan => name).first
    if plan.present?
      self.subscription = plan
      self.expires = Date.current + plan.duration.month
      self.save
    end
  end
end
