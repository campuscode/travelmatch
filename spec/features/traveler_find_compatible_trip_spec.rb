require 'rails_helper'

feature 'Traveler find a compatible trip' do
  scenario 'successfully' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )
    trip_plan = TripPlan.create(
      title: 'Mochilão na Europa',
      start_date: '01/06/2018', end_date: '01/07/2018', user: user_owner
    )

    Itinerary.create(
      location: 'Varsóvia', season: 'Férias de Julho',
      start_date: '01/06/2018', end_date: '01/07/2018',
      trip_plan: trip_plan
    )

    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'Varsóvia'
    fill_in 'Data inicial', with: '06/06/2018'
    fill_in 'Data final', with: '09/06/2018'
    click_on 'Buscar'
    click_on 'Mais detalhes'

    # Expectativa
    expect(page).to have_css('h3', text: 'Mochilão na Europa')
    expect(page).to have_css('h5', text: 'Varsóvia')
    expect(page).to have_css('li', text: 'De 01/06/2018 a 01/07/2018')
  end
  scenario 'and start date cant be greater than end date' do
    # Navegacao
    visit root_path
    fill_in 'Localização', with: 'Varsóvia'
    fill_in 'Data inicial', with: '06/07/2018'
    fill_in 'Data final', with: '09/06/2018'
    click_on 'Buscar'

    # Expectativa
    expect(page).to have_content('A data inicial não pode ser
                                  maior que a data final')
  end
end
