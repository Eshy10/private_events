require 'rails_helper'

RSpec.describe 'Creating an event', type: :feature do
    let(:user) { User.create(name: 'Maggie') }

  before(:each) do
      visit login_path
      fill_in 'session_name', with: user.name
      click_button 'Log in'
      expect(page).to have_content('Logged in!') 
  end

  scenario 'valid inputs' do
    visit new_event_path
    fill_in 'event_date', with: Date.today
    fill_in 'event_title', with: 'Meeting'
    fill_in 'event_location', with: 'Lagos'
    fill_in 'event_description', with: 'Second meeting'
    click_button 'Submit'
    visit root_path
    expect(page).to have_content(Date.today)
    expect(page).to have_content('Meeting')
    expect(page).to have_content('Lagos')
    expect(page).to have_content('Second meeting')
  end

  scenario 'invalid inputs' do
    visit new_event_path
    fill_in 'event_date', with: ''
    fill_in 'event_title', with: ''
    fill_in 'event_location', with: ''
    fill_in 'event_description', with: ''
    click_button 'Submit'
    expect(page).to have_content("Date can't be blank" )
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end