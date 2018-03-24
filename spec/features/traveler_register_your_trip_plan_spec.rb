require 'rails_helper'

feature 'Traveler register your trip plan' do
  scenario 'successfully' do
    # Navegacao
    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Criar novo plano'
    fill_in 'Nome', with: 'Lua de Mel'
    fill_in 'Data inicial', with: '07/10/2018'
    fill_in 'Data final', with: '21/10/2018'
    click_on 'Criar'

    # Expectativa
    expect(page).to have_css('h3', text: 'Plano de Viagem')
    expect(page).to have_css('h5', text: 'Lua de Mel')
    expect(page).to have_css('li', text: '07/10/2018')
    expect(page).to have_css('li', text: '21/10/2018')
    expect(current_path).to eq(trip_plans_path)
  end

  scenario 'and must fill all fields' do
    # Navegacao
    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Criar novo plano'
    fill_in 'Nome', with: ''
    fill_in 'Data inicial', with: ''
    fill_in 'Data final', with: ''
    click_on 'Criar'

    # Expectativa
    expect(page).to have_content('Não foi possível criar seu plano')
  end

  scenario "and end_date can't be smaller than start_date" do
    # Navegacao
    visit root_path
    click_on 'Planos de Viagem'
    click_on 'Criar novo plano'
    fill_in 'Nome', with: 'Mochilão na Bolívia'
    fill_in 'Data inicial', with: '07/10/2018'
    fill_in 'Data final', with: '01/10/2018'
    click_on 'Criar'

    # Expectativa
    expect(page).to have_content('Não foi possível criar seu plano.')
  end
end
