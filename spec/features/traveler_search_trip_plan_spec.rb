require 'rails_helper'

feature 'Traveler search for a trip plan' do
  scenario 'successfully' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(
      title: 'Mochilão América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019', user: user_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano',
      start_date: '01/01/2019', end_date: '01/02/2019', trip_plan: trip_plan
    )

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '01/01/2019'
    fill_in 'Data final', with: '01/02/2019'
    click_on 'Buscar'

    # Expectativas
    expect(page).to have_content('Resultados encontrados')
    expect(page).to have_css('h1', text: 'Mochilão América do Sul')
    expect(page).to have_css('li', text: 'Data inicial: 01/01/2019')
    expect(page).to have_css('li', text: 'Data final: 01/02/2019')
  end
  scenario 'and view only the correct trip plan' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    other_owner = User.create(
      email: 'ele@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(
      title: 'Mochilão América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019', user: user_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano',
      start_date: '01/01/2019', end_date: '01/02/2019', trip_plan: trip_plan
    )

    another_trip_plan = TripPlan.create(
      title: 'Férias em São Paulo',
      start_date: '01/03/2019', end_date: '01/04/2019', user: other_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Férias escolares',
      start_date: '01/03/2019', end_date: '01/04/2019',
      trip_plan: another_trip_plan
    )

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '01/01/2019'
    fill_in 'Data final', with: '01/02/2019'
    click_on 'Buscar'

    # Expectativas
    expect(page).to have_content('Resultados encontrados')
    expect(page).to have_css('h1', text: 'Mochilão América do Sul')
    expect(page).to have_css('li', text: 'Data inicial: 01/01/2019')
    expect(page).to have_css('li', text: 'Data final: 01/02/2019')

    expect(page).not_to have_css('h1', text: 'Férias em São Paulo')
    expect(page).not_to have_css('li', text: 'Data inicial: 01/03/2019')
    expect(page).not_to have_css('li', text: 'Data final: 01/04/2019')
  end
  scenario 'and view results that are in range by start_date' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    other_owner = User.create(
      email: 'ele@travel.com', password: '12345678'
    )

    another_owner = User.create(
      email: 'ela@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(
      title: 'Mochilão América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019', user: user_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano', start_date: '01/01/2019',
      end_date: '01/02/2019', trip_plan: trip_plan
    )

    trip_plan_two = TripPlan.create(
      title: 'Férias em São Paulo',
      start_date: '01/03/2019', end_date: '01/04/2019', user: other_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Férias escolares',
      start_date: '01/03/2019', end_date: '01/04/2019',
      trip_plan: trip_plan_two
    )

    trip_plan_three = TripPlan.create(
      title: 'Mochilão em São Paulo',
      start_date: '10/01/2019', end_date: '10/03/2019', user: another_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano', start_date: '10/01/2019',
      end_date: '10/03/2019', trip_plan: trip_plan_three
    )

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '01/01/2019'
    fill_in 'Data final', with: '01/02/2019'
    click_on 'Buscar'

    # Expectativas
    expect(page).to have_content('Resultados encontrados')
    expect(page).to have_css('h1', text: 'Mochilão América do Sul')
    expect(page).to have_css('li', text: 'Data inicial: 01/01/2019')
    expect(page).to have_css('li', text: 'Data final: 01/02/2019')

    expect(page).to have_css('h1', text: 'Mochilão em São Paulo')
    expect(page).to have_css('li', text: 'Data inicial: 10/01/2019')
    expect(page).to have_css('li', text: 'Data final: 10/03/2019')

    expect(page).not_to have_css('h1', text: 'Férias em São Paulo')
    expect(page).not_to have_css('li', text: 'Data inicial: 01/03/2019')
    expect(page).not_to have_css('li', text: 'Data final: 01/04/2019')
  end
  scenario 'and view results that are in range by end_date' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    other_owner = User.create(
      email: 'ele@travel.com', password: '12345678'
    )

    trip_plan_one = TripPlan.create(
      title: 'Mochilão América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019', user: user_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano',
      start_date: '01/01/2019', end_date: '01/02/2019',
      trip_plan: trip_plan_one
    )

    trip_plan_two = TripPlan.create(
      title: 'Férias em São Paulo',
      start_date: '01/03/2019', end_date: '01/04/2019', user: other_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Férias escolares',
      start_date: '01/03/2019', end_date: '01/04/2019',
      trip_plan: trip_plan_two
    )

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '01/01/2019'
    fill_in 'Data final', with: '20/01/2019'
    click_on 'Buscar'

    # Expectativas
    expect(page).to have_content('Resultados encontrados')
    expect(page).to have_css('h1', text: 'Mochilão América do Sul')
    expect(page).to have_css('li', text: 'Data inicial: 01/01/2019')
    expect(page).to have_css('li', text: 'Data final: 01/02/2019')

    expect(page).not_to have_css('h1', text: 'Férias em São Paulo')
    expect(page).not_to have_css('li', text: 'Data inicial: 01/03/2019')
    expect(page).not_to have_css('li', text: 'Data final: 01/04/2019')
  end
  scenario 'and dont found any results' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(
      title: 'Mochilão América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019', user: user_owner
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano', start_date: '01/01/2019',
      end_date: '01/02/2019', trip_plan: trip_plan
    )

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '01/11/2019'
    fill_in 'Data final', with: '01/12/2019'
    click_on 'Buscar'

    # Expectativas
    expect(page).to have_content('Nenhum resultado encontrado')
    expect(page).not_to have_content('Resultados encontrados')
    expect(page).not_to have_css('h1', text: 'Mochilão América do Sul')
    expect(page).not_to have_css('li', text: 'Data inicial: 01/01/2019')
    expect(page).not_to have_css('li', text: 'Data final: 01/02/2019')
  end
  scenario 'and the start_date cant be bigger than end_date' do
    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '01/01/2019'
    fill_in 'Data final', with: '01/02/2018'
    click_on 'Buscar'

    # Expectativas
    expect(page).to have_content('A data inicial não pode ser maior
                                  que a data final')
  end
end
