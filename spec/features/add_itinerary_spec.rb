require 'rails_helper'

feature 'Traveler add a script in Travel plan' do
  scenario 'successfully' do

    tp = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')

    visit new_trip_plan_itinerary_path(tp)

    fill_in 'Localização', with: 'Rio de janeiro'
    fill_in 'Temporada', with: 'Natal e ano novo'
    fill_in 'Data início', with: '20/12/2018'
    fill_in 'Data fim', with: '03/01/2019'
    click_on 'Salvar'

    expect(page).to have_content('Roteiro cadastrado com sucesso.')
  end

  scenario 'and has to fill all fields' do
    tp = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')

    visit new_trip_plan_itinerary_path(tp)

    fill_in 'Localização', with: ''
    fill_in 'Temporada', with: ''
    fill_in 'Data início', with: ''
    fill_in 'Data fim', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você precisa preencher todos os campos.')
  end
end
