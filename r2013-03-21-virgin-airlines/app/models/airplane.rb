# == Schema Information
#
# Table name: airplanes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rows       :integer
#  cols       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Airplane < ActiveRecord::Base
  attr_accessible :name, :rows, :cols
  has_many :flights

  def layout
    (1..self.cols).map{|c| (1..self.rows).map{|r| Airplane.seat_name(c, r)}}.flatten
  end

  def seats
    self.rows * self.cols
  end

  def Airplane.seat_name(col, row)
    "#{(col + 64).chr}-#{row}"
  end
end
