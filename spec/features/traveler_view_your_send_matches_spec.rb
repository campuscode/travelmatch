require 'rails_helper'

feature 'Traveler view your send matches' do
  scenario 'successfully' do
    # Criacao dos dados
    owner = User.create(
      email: 'ele@travel.com', password: '12345678'
    )

    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(
      title: 'Mochilão na Europa',
      start_date: '01/06/2018', end_date: '01/07/2018', user: owner
    )

    Itinerary.create(
      location: 'Varsóvia', season: 'Férias de Julho',
      start_date: '01/06/2018', end_date: '01/07/2018',
      trip_plan: trip_plan
    )

    Match.create(
      comment: 'Olá, quero ver seu plano.', trip_plan: trip_plan,
      user: user
    )

    # Navegacao
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Meus matches'

    # Expectativas
    expect(page).to have_css('h1', text: 'Meus Matches')
    expect(page).to have_css('h2', text: 'Mochilão na Europa')
    expect(page).to have_css('p', text: 'De: 01/06/2018 a 01/07/2018')
    expect(page).to have_css('p', text: 'Status: pendent')
  end
  scenario 'and cant view matches from anothers users' do
    # Criacao dos dados
    owner = User.create(
      email: 'ele@travel.com', password: '12345678'
    )

    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    another_user = User.create(
      email: 'outro@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(
      title: 'Mochilão na Europa',
      start_date: '01/06/2018', end_date: '01/07/2018', user: owner
    )

    Itinerary.create(
      location: 'Varsóvia', season: 'Férias de Julho',
      start_date: '01/06/2018', end_date: '01/07/2018',
      trip_plan: trip_plan
    )

    another_trip_plan = TripPlan.create(
      title: 'Mochilão na América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019', user: owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Férias de Janeiro',
      start_date: '01/01/2019', end_date: '10/01/2019',
      trip_plan: another_trip_plan
    )

    Match.create(
      comment: 'Olá, quero ver seu plano.', trip_plan: trip_plan,
      user: user
    )

    Match.create(
      comment: 'Olá, quer compartilhar sua viagem?',
      trip_plan: another_trip_plan, user: another_user
    )

    # Navegacao
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Meus matches'

    # Expectativas
    expect(page).to have_css('h1', text: 'Meus Matches')
    expect(page).to have_css('h2', text: 'Mochilão na Europa')
    expect(page).to have_css('p', text: 'De: 01/06/2018 a 01/07/2018')
    expect(page).to have_css('p', text: 'Status: pendent')

    expect(page).not_to have_css('h2', text: 'Mochilão na América do Sul')
    expect(page).not_to have_css('p', text: 'De: 01/01/2019 a 01/02/2019')
  end
  scenario 'and dont have matches yet' do
    # Criacao dos dados
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )
    # Navegacao

    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Meus matches'

    # Expectativas
    expect(page).to have_content('Você não possui nenhum match.')
  end
end
