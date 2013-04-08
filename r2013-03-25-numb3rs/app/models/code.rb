# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Code < ActiveRecord::Base
  attr_accessible :url
  has_many :characters

  before_save :nuke_data
  after_save :get_data

  private

  def nuke_data
    Character.delete_all
    Code.delete_all
  end

  def get_data
    html = HTTParty.get(self.url)
    doc = Nokogiri::HTML(html)

    td_hex = doc.xpath('//body/table[2]/tr[5]/td/table[2]/tr/td[3]').to_a
    td_sym = doc.xpath('//body/table[2]/tr[5]/td/table[2]/tr/td[5]').to_a

    td_hex.shift
    td_sym.shift

    td_hex.each_with_index do |td, index|
      hex = td.content
      sym = td_sym[index].content
      self.characters << Character.create(hex: hex, symbol: sym)
    end
  end
end
