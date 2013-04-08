# == Schema Information
#
# Table name: declarations
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Declaration do
  describe '.create' do
    it 'gets the declaration of independence and converts to an array of words' do
      url = 'http://www.constitution.org/usdeclar.txt'
      declaration = Declaration.create(:url => url)
      expect(declaration.words.count).to_not be 0
    end
  end
end
