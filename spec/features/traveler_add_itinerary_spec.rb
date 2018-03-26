require 'rails_helper'

feature 'Traveler add a itinerary in Travel Plan' do
  scenario 'successfully' do

    tp = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '20/12/2018', end_date: '30/01/2019')

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Adiciona Roteiro'

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

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Adiciona Roteiro'

    fill_in 'Localização', with: ''
    fill_in 'Temporada', with: ''
    fill_in 'Data início', with: ''
    fill_in 'Data fim', with: ''
    click_on 'Salvar'

    expect(page).to have_content('Você precisa preencher todos os campos.')
  end

  xscenario "and start_date can't be bigger than end_date"  do
    trip_plan = TripPlan.create(title: 'Férias de fim de ano',
      start_date: '13/02/2019', end_date: '16/02/2019')

    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Férias de fim de ano'
    click_on 'Adiciona Roteiro'

    fill_in 'Localização', with: 'Bahia'
    fill_in 'Temporada', with: 'Carnaval'
    fill_in 'Data início', with: '16/02/2019'
    fill_in 'Data fim', with: '13/02/2019'
    click_on 'Salvar'

    expect(page).to have_content('A data ínicio não pode ser maior que a data fim.')
    expect(page).to have_css('h1', 'Novo itinerário.')
  end
end
