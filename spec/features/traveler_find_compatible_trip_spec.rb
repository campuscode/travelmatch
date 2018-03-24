require 'rails_helper'

feature 'Traveler find a compatible trip' do
  scenario 'successfully' do
    # Criacao dos dados
    trip_plan = TripPlan.create(title: 'Mochilão na Europa',
                                start_date: '01/06/2018',
                                end_date: '01/07/2018')

    itinerary = Itinerary.create(location: 'Varsóvia',
                                season: 'Férias de Julho',
                                start_date: '01/06/2018',
                                end_date: '01/07/2018',
                                trip_plan: trip_plan)

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'Varsóvia'
    fill_in 'Data inicial', with: '06/06/2018'
    fill_in 'Data final', with: '09/06/2018'
    click_on 'Buscar'
    click_on 'Mais detalhes'

    # Expectativa
    expect(page).to have_content('Deu match!')
    expect(page).to have_css('h3', text: 'Mochilão na Europa')
    expect(page).to have_css('h5', text: 'Varsóvia')
    expect(page).to have_css('li', text: 'Data inicial: 01/06/2018')
    expect(page).to have_css('li', text: 'Data final: 01/07/2018')

  end
end
