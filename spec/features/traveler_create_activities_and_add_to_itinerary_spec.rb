require 'rails_helper'

feature 'traveler register activities and add in itinerary' do
  scenario 'successfully' do
    tp = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan:tp)

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'
    click_on 'Criar nova atividade'

    fill_in 'Nome:', with: 'Almoço'
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

  scenario 'and show a hotel informations' do
    tp = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan:tp)

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'
    click_on 'Adicionar atividade'

    fill_in 'Nome:', with: 'Hotel'
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

  scenario 'and show tourist spot informations' do
    tp = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')
    itinerary = Itinerary.create(location: 'Rio de janeiro',
      season: 'Natal e ano novo', start_date: '20/12/2018',
      end_date: '30/01/2019', trip_plan:tp)

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Rio de janeiro'
    click_on 'Adicionar atividade'

    fill_in 'Nome:', with: 'Cristo no Rio'
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
