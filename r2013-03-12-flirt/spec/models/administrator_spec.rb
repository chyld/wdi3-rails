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

require 'spec_helper'

describe Administrator do
  describe '.create' do
    it 'has an id' do
      administrator = Administrator.create(role: 'dba')
      expect(administrator.id).to_not be nil
    end
    it 'role fails validation when blank' do
      administrator = Administrator.create
      expect(administrator.id).to be nil
    end
  end

  describe '#user' do
    it 'has a user' do
      administrator = Administrator.create(role: 'dba')
      user = FactoryGirl.create(:generic_user)
      administrator.user = user
      expect(administrator.user).to eq user
    end
  end
end
