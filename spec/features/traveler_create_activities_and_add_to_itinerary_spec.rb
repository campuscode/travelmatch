require 'rails_helper'

feature 'traveler register activities and add in itinerary' do
  scenario 'successfully a tourist spot' do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)
    activity = TouristSpot.create(title:'Cristo',
      comment:'Cristo Redentor',
      location:'Corcovado', activity_date: '20/12/2018',
      itinerary: itinerary, spot_type: 'Monumento', value: 150.00 )

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'

    expect(page).to have_css('h3', text: 'Cristo')
    expect(page).to have_css('li', text: 'Cristo Redentor')
    expect(page).to have_css('li', text: 'Corcovado')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Monumento')
    expect(page).to have_css('li', text: 'R$ 150,00')
  end

  scenario 'successfully a hotel' do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)
    activity = Accommodation.create(title:'Hotel na paulista',
      comment:'Hotel 5 estrelas na paulista',
      location:'Avenida Paulista', activity_date: '20/12/2018',
      itinerary: itinerary, daily_value: 'R$ 150,00',
      accomodation_type: 'Hotel' )

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'

    expect(page).to have_css('h3', text: 'Cristo')
    expect(page).to have_css('li', text: 'Cristo Redentor')
    expect(page).to have_css('li', text: 'Corcovado')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Hotel')
    expect(page).to have_css('li', text: 'R$ 150,00')
  end

  scenario 'successfully a restaurant' do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)
    activity = Meal.create(title:'Almoço', comment:'Comida típica carioca',
      location:'Corcovado', activity_date: '20/12/2018', itinerary: itinerary,
      cuisine: 'Brasileira', price_rating: 'Caro' )

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'

    expect(page).to have_css('h3', text: 'Almoço')
    expect(page).to have_css('li', text: 'Comida típica carioca')
    expect(page).to have_css('li', text: 'Corcovado')
    expect(page).to have_css('li', text: '20/12/2018')
    expect(page).to have_css('li', text: 'Brasileira')
    expect(page).to have_css('li', text: 'Caro')
  end

  xscenario 'end show a restaurant' do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'
    click_on 'Criar nova atividade'

    fill_in 'Título:', with: 'Almoço'
    fill_in 'Comentário:', with: 'Retaurante italiano no centro'
    fill_in 'Localização:', with: 'Rua: Tapajós N355'
    fill_in 'Data:', with: '20/12/2018'

    select 'Restaurante', from: 'Tipo de atividade'
    fill_in 'Tipo de cozinha:', with: 'Italiana'
    fill_in 'Classificação de preço:', with: 'Barato'

    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Atividade')
    expect(page).to have_css('h3', text: 'Almoço')
    expect(page).to have_css('p', text: 'Retaurante italiano no centro')
    expect(page).to have_css('p', text: 'Rua: Tapajós N355')
    expect(page).to have_css('p', text: '20/12/2018')
    expect(page).not_to have_content('Salvar')
  end

  xscenario 'and show a hotel informations' do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'
    click_on 'Adicionar atividade'

    fill_in 'Título:', with: 'Hotel'
    fill_in 'Comentário:', with: 'Hospedagem'
    fill_in 'Localização:', with: 'Rua São João 567'
    fill_in 'Data:', with: '20/12/2018'

    select 'Hospedagem', from: 'Tipo de atividade'
    fill_in 'Tipo de hospedagem:', with: 'Hotel'
    fill_in 'Valor da diária:', with: '15,50'

    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Atividade')
    expect(page).to have_css('h3', text: 'Hotel')
    expect(page).to have_css('p', text: 'Hospedagem')
    expect(page).to have_css('p', text: 'Rua São João 567')
    expect(page).to have_css('p', text: '20/12/2018')
    expect(page).not_to have_content('Salvar')
  end

  xscenario 'and show tourist spot informations' do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan: trip_plan)

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'
    click_on 'Adicionar atividade'

    fill_in 'Título:', with: 'Cristo no Rio'
    fill_in 'Comentário:', with: 'Cristo Redentor'
    fill_in 'Localização:', with: 'Corcovado'
    fill_in 'Data:', with: '20/12/2018'

    select 'Ponto Turístico', from: 'Tipo de atividade'
    fill_in 'Tipo de atração:', with: 'Estátua'
    fill_in 'Valor da entrada:', with: '90,00'

    click_on 'Salvar'

    expect(page).to have_css('h1', text: 'Atividade')
    expect(page).to have_css('h3', text: 'Cristo no Rio')
    expect(page).to have_css('p', text: 'Cristo Redentor')
    expect(page).to have_css('p', text: 'Corcovado')
    expect(page).to have_css('p', text: '20/12/2018')
    expect(page).not_to have_content('Salvar')
  end
end
