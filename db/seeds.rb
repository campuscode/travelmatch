#### Usuários
user = User.create(
  email: 'maria@travel.com', password: '12345678'
)

other_user = User.create(
  email: 'joao@travel.com', password: '12345678'
)
user_match = User.create(
  email: 'diogo@gmail.com', password: '12345678'
)

user_match2 = User.create(
  email: 'glauco@gmail.com', password: '12345678'
)

user_negado = User.create(
  email: 'eu@yahoo.com.br', password: '12345678'
)

user_novo = User.create(
  email: 'glauco@glauco.com', password: '12345678'
)

#### Planos de Viagem

trip_plan = TripPlan.create(title: 'Mochilão na América do Sul',
  start_date: '01/01/2019', end_date: '01/03/2019', user: user,
  description: 'Mochilão pela América do Sul iniciando em Buenos Aires até Machu Picchu')

trip_plan2 = TripPlan.create(title: 'Mochilão pelo Nordeste do Brasil',
  start_date: '01/05/2019', end_date: '01/06/2019', user: user,
  description: 'Viagem percorrendo as praias do Nordeste brasileiro focando também na gastronomia nordestina')

trip_plan3 = TripPlan.create(title: 'Turismo em São Paulo',
  start_date: '20/01/2019', end_date: '10/02/2019', user: user,
  description: 'Conhecendo todos pontos turísticos de São Paulo como museus, centros comerciais, bares etc.')

trip_plan4 = TripPlan.create(title: 'Desvendando o Japão',
  start_date: '21/07/2016', end_date: '12/09/2016', user: user,
  description: 'Mochilão feito no Japão para conhecer as cidades de Tóquio, Takayama, Hiroshima e Quioto')

#### Roteiros Trip 1

Itinerary.create(
  location: 'Buenos Aires', season: 'Verão',
  start_date: '01/01/2019', end_date: '10/01/2019', trip_plan: trip_plan
)
Itinerary.create(
  location: 'São Paulo', season: 'Verão',
  start_date: '11/01/2019', end_date: '01/02/2019', trip_plan: trip_plan
)
Itinerary.create(
  location: 'Machu Picchu', season: 'Verão',
  start_date: '02/02/2019', end_date: '15/02/2019', trip_plan: trip_plan
)
Itinerary.create(
  location: 'Córdoba', season: 'Verão',
  start_date: '16/02/2019', end_date: '28/02/2019', trip_plan: trip_plan
)

#### Roteiros Trip 2

Itinerary.create(
  location: 'João Pessoa', season: 'Férias de Julho',
  start_date: '02/05/2019', end_date: '08/05/2019', trip_plan: trip_plan2
)
Itinerary.create(
  location: 'Recife', season: 'Férias de Julho',
  start_date: '09/05/2019', end_date: '15/05/2019', trip_plan: trip_plan2
)
Itinerary.create(
  location: 'Natal', season: 'Férias de Julho',
  start_date: '16/02/2019', end_date: '30/05/2019', trip_plan: trip_plan2
)

#### Matches no Plano da Maria
Match.create(
  comment: 'Gostaria de fazer uma viagem parecida! Me aceita',
  trip_plan: trip_plan, user: other_user
)
Match.create(
  comment: 'Olá, vamos trocar informações?', trip_plan: trip_plan,
  user: user_match
)
Match.create(
  comment: 'Também vou nesse destino de férias! Me ajuda!',
  trip_plan: trip_plan, user: user_match2
)
Match.create(
  comment: 'Viagem tosca!', trip_plan: trip_plan,
  user: user_negado
)

#### Matches de Maria

Match.create(
  comment: 'Olá, poderia compartilhar esse roteiro?', trip_plan: trip_plan2,
  user: user
)
Match.create(
  comment: 'Olá, poderia compartilhar esse roteiro?', trip_plan: trip_plan3,
  user: user
)
