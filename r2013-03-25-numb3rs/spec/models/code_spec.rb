# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Code do
  before(:each) do
    Code.create(url: 'http://www.ascii-code.com/')
  end

  describe '.create' do
    it 'creates a code object' do
      code = Code.first
      expect(code).to_not be nil
    end
  end

  describe '#hex' do
    it 'gets the hex character' do
      code = Code.first.characters.where(:hex => '41').first
      expect(code.hex).to eq '41'
      expect(code.symbol).to eq 'A'
    end
  end

  describe '#symbol' do
    it 'gets the hex character' do
      code = Code.first.characters.where(:symbol => 'A').first
      expect(code.hex).to eq '41'
      expect(code.symbol).to eq 'A'
    end
  end
end
