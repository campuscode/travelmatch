# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
  email: 'eu@travel.com', password: '12345678'
)

other_user = User.create(
  email: 'ele@travel.com', password: '12345678'
)

trip_plan = TripPlan.create(title: 'Mochilão na América do Sul',
                start_date: '01/01/2019', end_date: '01/03/2019',
                user: user)

Itinerary.create(
  location: 'Bogotá', season: 'Verão',
  start_date: '01/01/2019', end_date: '10/01/2019', trip_plan: trip_plan
)

Itinerary.create(
  location: 'Medelín', season: 'Verão',
  start_date: '11/01/2019', end_date: '20/01/2019', trip_plan: trip_plan
)

Itinerary.create(
  location: 'Cali', season: 'Verão',
  start_date: '21/01/2019', end_date: '28/02/2019', trip_plan: trip_plan
)

match = Match.create(
  comment: 'Olá, quero participar dessa trip!', trip_plan: trip_plan,
  user: other_user
)
