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

require 'spec_helper'

describe Subscription do
  let(:subscription) {Subscription.create}

  describe '.create' do
    it 'has an id' do
      expect(subscription.id).to_not be nil
    end
  end

  describe '#subscribers' do
    it 'has subscribers' do
      subscription.subscribers << FactoryGirl.create(:subscriber_no_subscription)
      expect(subscription.subscribers.count).to eq 1
    end
  end
end
