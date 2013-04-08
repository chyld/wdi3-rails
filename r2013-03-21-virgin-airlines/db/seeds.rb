User.delete_all
Reservation.delete_all
Flight.delete_all
Airplane.delete_all

u1 = User.create(email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
u2 = User.create(email: 'sue@gmail.com', password: 'a', password_confirmation: 'a')
u3 = User.create(email: 'jil@gmail.com', password: 'a', password_confirmation: 'a')
u4 = User.create(email: 'admin@gmail.com', password: 'a', password_confirmation: 'a')
u4.is_admin = true
u4.save

a1 = Airplane.create(name: 'Boeing 747', rows: 15, cols: 3)
a2 = Airplane.create(name: 'Dreamliner', rows: 5, cols: 2)
a3 = Airplane.create(name: 'Airbus A380', rows: 20, cols: 8)

f1 = Flight.create(name: 'V339', depart: 'EWR', arrive: 'SFO', departure: Date.current + 7.day, airplane_id: a2.id)
f2 = Flight.create(name: 'V101', depart: 'EWR', arrive: 'SFO', departure: Date.current + 1.day, airplane_id: a1.id)
f3 = Flight.create(name: 'V101', depart: 'JFK', arrive: 'SFO', departure: Date.current + 1.day, airplane_id: a1.id)
f4 = Flight.create(name: 'V981', depart: 'JFK', arrive: 'SFO', departure: Date.current + 4.day, airplane_id: a1.id)
f5 = Flight.create(name: 'V981', depart: 'EWR', arrive: 'SFO', departure: Date.current + 4.day, airplane_id: a1.id)
f6 = Flight.create(name: 'V201', depart: 'JFK', arrive: 'SFO', departure: Date.current + 5.day, airplane_id: a2.id)
f7 = Flight.create(name: 'V241', depart: 'JFK', arrive: 'SFO', departure: Date.current + 3.day, airplane_id: a3.id)
f8 = Flight.create(name: 'V207', depart: 'JFK', arrive: 'BOS', departure: Date.current + 6.day, airplane_id: a3.id)
f9 = Flight.create(name: 'V341', depart: 'JFK', arrive: 'SFO', departure: Date.current + 2.day, airplane_id: a2.id)

r1 = Reservation.create(row: 1, col: 1, user_id: u1.id, flight_id: f1.id)
r2 = Reservation.create(row: 2, col: 2, user_id: u1.id, flight_id: f1.id)
r3 = Reservation.create(row: 2, col: 1, user_id: u2.id, flight_id: f1.id)
r4 = Reservation.create(row: 5, col: 1, user_id: u3.id, flight_id: f1.id)
