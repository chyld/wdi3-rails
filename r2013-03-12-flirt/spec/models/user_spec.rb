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

require 'spec_helper'

describe User do
  describe '.create' do
    it 'has an id' do
      user = User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.id).to_not be nil
    end
    it 'fails validation' do
      user = User.create
      expect(user.id).to be nil
    end
  end

  context 'requires a valid user, subscriber and administrator' do
    let(:user) {User.create(username: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')}
    let(:subscriber) {FactoryGirl.create(:subscriber_no_subscription)}
    let(:admin) {FactoryGirl.create(:administrator)}

    describe '#sub' do
      it 'returns a Subscriber object' do
        subscriber.user = user
        expect(user.sub).to eq subscriber
      end
      it 'return nil when the user is not a subscriber' do
        admin.user = user
        expect(user.sub).to be nil
      end
    end

    describe '#admin' do
      it 'returns a Administrator object' do
        admin.user = user
        expect(user.admin).to eq admin
      end
      it 'return nil when the user is not an admin' do
        subscriber.user = user
        expect(user.admin).to be nil
      end
    end
  end
end
