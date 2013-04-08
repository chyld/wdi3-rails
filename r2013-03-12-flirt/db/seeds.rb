User.delete_all
Administrator.delete_all
Subscriber.delete_all
Subscription.delete_all

['Free', 'Basic', 'Flirt'].each_with_index do |name, index|
  Subscription.create(plan: name, duration: index + 1)
end

u1 = User.create(email: 'a1@gmail.com', username: 'Anonymous-1', password: 'a', password_confirmation: 'a')
u2 = User.create(email: 'a2@gmail.com', username: 'Anonymous-2', password: 'a', password_confirmation: 'a')
u3 = User.create(email: 'a3@gmail.com', username: 'Anonymous-3', password: 'a', password_confirmation: 'a')
u4 = User.create(email: 's1@gmail.com', username: 'Subscriber', password: 'a', password_confirmation: 'a')
u5 = User.create(email: 'a1@gmail.com', username: 'Admin', password: 'a', password_confirmation: 'a')

a1 = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
a2 = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
a3 = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
subscriber = Subscriber.create(tagline: 'please change tagline', bio: 'please change bio', gender: 'please change gender', age: 99)
admin = Administrator.create(role: 'DBA')
subscriber.purchase_plan('Basic')

a1.user = u1
a2.user = u2
a3.user = u3
subscriber.user = u4
admin.user = u5
