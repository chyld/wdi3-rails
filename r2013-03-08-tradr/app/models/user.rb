# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  balance         :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :balance, :password, :password_confirmation
  has_many :stocks, :inverse_of => :user

  def position
    self.stocks.map{|s| Stock.quote(s.symbol) * s.shares}.reduce(:+) || 0
  end

  def total
    self.position + self.balance
  end

  def purchase(symbol, shares)
    symbol = symbol.upcase
    stock = Stock.where(:symbol => symbol).first || Stock.new(:symbol => symbol, :shares => 0)
    stock.shares += shares
    stock.save
    self.stocks << stock if self.stocks.exclude?(stock)
    self.balance -= Stock.quote(symbol) * shares
    self.save
  end

  def has_enough_money?(symbol, shares)
    symbol = symbol.upcase
    quote = Stock.quote(symbol)
    (quote * shares) <= self.balance
  end
end
