require 'rails_helper'

feature 'Traveler aprove a match in your trip plan' do
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
      click_on 'Aceitar'
    end

    # Expectativa
    expect(page).to have_css('h5', text: 'Matches deste plano')
    expect(page).to have_css('p', text: match.user.email)
  end
  scenario 'and aprove only a request' do
    # Criacao dos dados
    user_owner = User.create(
      email: 'eu@travel.com', password: '12345678'
    )

    user_match = User.create(
      email: 'ela@travel.com', password: 'abcdefgh'
    )

    other_user_match = User.create(
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

    match = Match.create(
      comment: 'Bora fazer um mochilas?', trip_plan: trip_plan,
      user: other_user_match
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
      click_on 'Aceitar'
    end

    # Expectativa
    expect(page).to have_css('h5', text: 'Matches deste plano')
    expect(page).to have_css('p', text:user_match.email)
  end
end
