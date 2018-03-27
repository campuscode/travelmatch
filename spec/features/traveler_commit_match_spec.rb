require 'rails_helper'

feature 'Traveler commit a match' do
  scenario 'successfully' do
    # Criacao dos dados
    trip_plan = TripPlan.create(
      title: 'Mochilão América do Sul',
      start_date: '01/01/2019', end_date: '01/02/2019'
    )

    Itinerary.create(
      location: 'São Paulo', season: 'Começo do ano',
      start_date: '01/01/2019', end_date: '01/02/2019', trip_plan: trip_plan
    )

    # Navegacao
    visit trip_plan_path(trip_plan)
    fill_in 'Envie uma mensagem', with: 'Olá, aceita meu match?'
    click_on 'Solicite um match'

    # Expectativas
    expect(page).to have_css("Sua solicitação foi enviada com sucesso!")
  end
end
