require 'rails_helper'

feature 'Traveler reject a match your trip plan' do
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

    match = Match.create(
      comment: 'Olá, quero ver seu plano.', trip_plan: trip_plan,
      user: user_match
    )

    # Navegacao
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user_owner.email
    fill_in 'Senha', with: user_owner.password
    click_on 'Enviar'
    click_on 'Meus planos'
    click_on trip_plan.title
    within("div#match_#{match.id}") do
      click_on 'Rejeitar'
    end

    # Expectativa
    expect(page).to have_content('Match rejeitado com sucesso.')
  end
end
