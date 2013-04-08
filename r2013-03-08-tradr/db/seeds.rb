User.delete_all
Stock.delete_all

u1 = User.create(:email => 'bob@gmail.com', :balance => 100_000, :password => 'a', :password_confirmation => 'a')
u2 = User.create(:email => 'sue@gmail.com', :balance => 115_300, :password => 'a', :password_confirmation => 'a')

s1 = Stock.create(:symbol => 'aapl', :shares => 10)
s2 = Stock.create(:symbol => 'goog', :shares => 25)
s3 = Stock.create(:symbol => 'amzn', :shares => 15)
s4 = Stock.create(:symbol => 'msft', :shares => 75)
s5 = Stock.create(:symbol => 'ge', :shares => 35)

u1.stocks = [s1, s2, s3, s4]
u2.stocks = [s5]
