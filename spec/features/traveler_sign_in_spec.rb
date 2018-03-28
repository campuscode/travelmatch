require 'rails_helper'

feature 'Traveler sign in' do
  scenario 'successfully' do
    # Criacao dos dados
    user = User.create(email: 'eu@travel.com', password: '12345678')

    # Navegacao
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Enviar'

    # Expectativas
    expect(page).to have_content('Logado com sucesso.')
  end
  scenario 'and view your receives matches' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )
    user_match = User.create(
      email: 'ele@travel.com', password: 'abcdefg'
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
    click_on 'Mochilão na Europa'

    # Expectativas
    expect(page).to have_css('h5', text: 'Solicitações recebidas')
    expect(page).to have_css('p', text: match.user.email)
    expect(page).to have_css('p', text: match.comment)
    expect(page).to have_css('p', text: match.status)
  end
end
