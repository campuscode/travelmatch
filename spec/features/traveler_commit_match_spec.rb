require 'rails_helper'

feature 'Traveler commit a match' do
  scenario 'successfully' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )
    user_match = User.create(
      email: 'ele@travel.com', password: 'abcdefg'
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
    click_on 'Entrar'
    fill_in 'Email', with: user_match.email
    fill_in 'Senha', with: user_match.password
    click_on 'Enviar'
    visit trip_plan_path(trip_plan)
    fill_in 'Envie uma mensagem', with: 'Olá, aceita meu match?'
    click_on 'Solicite um match'

    # Expectativas
    expect(page).to have_css('p', text: 'pendent')
  end
end
