User.delete_all
Exercise.delete_all

u1 = User.create(:email => 'bob@gmail.com', :password => 'a', :password_confirmation => 'a')

er1 = Exercise.create(:activity => 'running', :value => 3.1, :unit => 'miles', :completed => '1/1/2013')
er2 = Exercise.create(:activity => 'running', :value => 4.2, :unit => 'miles', :completed => '2/1/2013')
er3 = Exercise.create(:activity => 'running', :value => 7.2, :unit => 'miles', :completed => '3/1/2013')
er4 = Exercise.create(:activity => 'running', :value => 3.4, :unit => 'miles', :completed => '4/1/2013')
er5 = Exercise.create(:activity => 'running', :value => 2.6, :unit => 'miles', :completed => '5/1/2013')
er6 = Exercise.create(:activity => 'running', :value => 5.9, :unit => 'miles', :completed => '6/1/2013')
er7 = Exercise.create(:activity => 'running', :value => 6.3, :unit => 'miles', :completed => '7/1/2013')
er8 = Exercise.create(:activity => 'running', :value => 4.1, :unit => 'miles', :completed => '8/1/2013')
er9 = Exercise.create(:activity => 'running', :value => 3.2, :unit => 'miles', :completed => '9/1/2013')

ew1 = Exercise.create(:activity => 'pushups', :value => 20, :unit => 'individual', :completed => '1/2/2013')
ew2 = Exercise.create(:activity => 'pushups', :value => 18, :unit => 'individual', :completed => '2/2/2013')
ew3 = Exercise.create(:activity => 'pushups', :value => 12, :unit => 'individual', :completed => '3/2/2013')
ew4 = Exercise.create(:activity => 'pushups', :value => 11, :unit => 'individual', :completed => '4/2/2013')
ew5 = Exercise.create(:activity => 'pushups', :value => 31, :unit => 'individual', :completed => '5/2/2013')
ew6 = Exercise.create(:activity => 'pushups', :value => 25, :unit => 'individual', :completed => '6/2/2013')
ew7 = Exercise.create(:activity => 'pushups', :value => 40, :unit => 'individual', :completed => '7/2/2013')
ew8 = Exercise.create(:activity => 'pushups', :value => 32, :unit => 'individual', :completed => '8/2/2013')
ew9 = Exercise.create(:activity => 'pushups', :value => 25, :unit => 'individual', :completed => '9/2/2013')

u1.exercises = [er1, er2, er3, er4, er5, er6, er7, er8, er9, ew1, ew2, ew3, ew4, ew5, ew6, ew7, ew8, ew9]
