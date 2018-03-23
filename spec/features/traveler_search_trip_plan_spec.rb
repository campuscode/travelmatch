require 'rails_helper'

feature 'Traveler search for a trip plan' do
  scenario 'successfully' do

    trip_plan = TripPlan.create(title: 'Mochilão América do Sul',
                start_date: '2019-01-01', end_date: '2019-02-01')

    itinerary = Itinerary.create(location: 'São Paulo', season: 'Começo do ano',
                start_date: '2019-01-01', end_date: '2019-02-01', trip_plan: trip_plan)

    visit root_path
    fill_in 'Localização', with: 'São Paulo'
    fill_in 'Data inicial', with: '2019-01-01'
    fill_in 'Data final', with: '2019-02-01'
    click_on 'Buscar'

    expect(page).to have_content('Resultados encontrados')
    expect(page).to have_css('h1', text: 'Mochilão América do Sul')
    expect(page).to have_css('li', text: 'Data inicial: 2019-01-01')
    expect(page).to have_css('li', text: 'Data final: 2019-02-01')

  end

end
