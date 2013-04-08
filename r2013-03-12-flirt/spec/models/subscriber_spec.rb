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

require 'spec_helper'

describe Subscriber do
  describe '.create' do
    it 'has an id' do
      subscriber = Subscriber.create(tagline: 'hey', bio: 'my bio', gender: 'female', age: 18)
      expect(subscriber.id).to_not be nil
    end
    it 'fails validation if tagline, bio or gender are not present or age < 18 years old' do
      subscriber = Subscriber.create
      expect(subscriber.id).to be nil
    end
  end

  context 'the subscriber must be present' do
    let(:subscriber) {Subscriber.create(tagline: 'hey', bio: 'my bio', gender: 'female', age: 18)}

    describe '#user' do
      it 'has a user' do
        user = FactoryGirl.create(:generic_user)
        subscriber.user = user
        expect(subscriber.user).to eq user
      end
    end

    describe '#subscription' do
      it 'has a subscription' do
        subscription = FactoryGirl.create(:subscription)
        subscriber.subscription = subscription
        expect(subscriber.subscription).to eq subscription
      end
    end

    describe '#has_subscription?' do
      it 'has a subscription' do
        subscription = FactoryGirl.create(:subscription)
        subscriber.subscription = subscription
        expect(subscriber.has_subscription?).to be_true
      end
      it 'does not have a subscription' do
        expect(subscriber.has_subscription?).to be_false
      end
    end

    describe '#purchase_plan' do
      it 'purchases a subscription' do
        subscription = FactoryGirl.create(:subscription)
        subscriber.purchase_plan(subscription.plan)
        expect(subscriber.subscription).to eq subscription
        expect(subscriber.expires).to eq (Date.current + subscription.duration.month)
      end
    end
  end
end
