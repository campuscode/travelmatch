require 'rails_helper'

feature 'traveler register activities and add in itinerary' do
  scenario 'successfully a tourist spot' do
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019', user: user)
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)
    activity = TouristSpot.create(title:'Cristo',
      comment:'Cristo Redentor',
      location:'Corcovado', activity_date: '20/12/2018',
      itinerary: itinerary, spot_type: 'Monumento', value: 150.00 )

  visit root_path

  click_on 'Entrar'
  fill_in 'Email', with: user.email
  fill_in 'Senha', with: user.password
  click_on 'Enviar'

  click_on 'Planos de Viagem'
  click_on 'Férias de fim de ano'
  click_on 'Natal e ano novo'

    expect(page).to have_css('h3', text: 'Cristo')
    expect(page).to have_css('li', text: 'Cristo Redentor')
    expect(page).to have_css('li', text: 'Corcovado')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Monumento')
    expect(page).to have_css('li', text: 'R$ 150,00')
  end

  scenario 'successfully a hotel' do
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019', user: user)
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)
    activity = Accommodation.create(title:'Hotel na paulista',
      comment:'Hotel 5 estrelas na paulista',
      location:'Avenida Paulista', activity_date: '20/12/2018',
      itinerary: itinerary, daily_value: '150',
      accommodation_type: 'Hotel' )

    visit root_path

    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Natal e ano novo'

    expect(page).to have_css('h3', text: 'Hotel na paulista')
    expect(page).to have_css('li', text: 'Hotel 5 estrelas na paulista')
    expect(page).to have_css('li', text: 'Avenida Paulista')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Hotel')
    expect(page).to have_css('li', text: 'R$ 150,00')
  end

  scenario 'successfully a restaurant' do
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019', user: user)
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)
    activity = Meal.create(title:'Almoço', comment:'Comida típica carioca',
      location:'Corcovado', activity_date: '20/12/2018', itinerary: itinerary,
      cuisine: 'Brasileira', price_rating: 'Caro' )

    visit root_path

    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Natal e ano novo'

    expect(page).to have_css('h3', text: 'Almoço')
    expect(page).to have_css('li', text: 'Comida típica carioca')
    expect(page).to have_css('li', text: 'Corcovado')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Brasileira')
    expect(page).to have_css('li', text: 'Caro')
  end

  scenario 'end add a new meal' do
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019', user: user)
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)

    visit root_path

    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Natal e ano novo'
    click_on 'Adicionar refeição'

    fill_in 'Título:', with: 'Almoço'
    fill_in 'Comentário:', with: 'Retaurante italiano no centro'
    fill_in 'Localização:', with: 'Rua: Tapajós N355'
    fill_in 'Data:', with: '20/12/2018'
    fill_in 'Tipo de cozinha:', with: 'Italiana'
    fill_in 'Classificação de preço:', with: 'Barato'

    click_on 'Salvar'

    expect(page).to have_css('h3', text: 'Almoço')
    expect(page).to have_css('li', text: 'Retaurante italiano no centro')
    expect(page).to have_css('li', text: 'Rua: Tapajós N355')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Italiana')
    expect(page).to have_css('li', text: 'Barato')
    expect(page).not_to have_content('Salvar')
  end

  scenario 'end add a tourist spot' do
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019', user: user)
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)

      visit root_path

    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Natal e ano novo'
    click_on 'Adicionar ponto turistico'

    fill_in 'Título:', with: 'Cristo'
    fill_in 'Comentário:', with: 'Cristo Redentor'
    fill_in 'Localização:', with: 'Corcovado'
    fill_in 'Data:', with: '20/12/2018'
    fill_in 'Tipo de ponto turistico:', with: 'Monumento'
    fill_in 'Entrada:', with: '150,00'

    click_on 'Salvar'

    expect(page).to have_css('h3', text: 'Cristo')
    expect(page).to have_css('li', text: 'Cristo Redentor')
    expect(page).to have_css('li', text: 'Corcovado')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Monumento')
    expect(page).to have_css('li', text: 'R$ 150,00')
    expect(page).not_to have_content('Salvar')
  end

  scenario 'end add a accommodation' do
    user = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019', user: user)
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)

    visit root_path

    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Natal e ano novo'
    click_on 'Adicionar hospedagem'

    fill_in 'Título:', with: 'Hotel na paulista'
    fill_in 'Comentário:', with: 'Hotel 5 estrelas na paulista'
    fill_in 'Localização:', with: 'Avenida Paulista'
    fill_in 'Data:', with: '20/12/2018'
    fill_in 'Tipo de hospedagem:', with: 'Hotel'
    fill_in 'Diária:', with: '150,00'

    click_on 'Salvar'

    expect(page).to have_css('h3', text: 'Hotel na paulista')
    expect(page).to have_css('li', text: 'Hotel 5 estrelas na paulista')
    expect(page).to have_css('li', text: 'Avenida Paulista')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Hotel')
    expect(page).to have_css('li', text: 'R$ 150,00')
    expect(page).not_to have_content('Salvar')
  end
end
