require 'rails_helper'

RSpec.describe 'Showing an event', type: :feature do
    let(:user) { User.create(name: 'Maggie') }

  before(:each) do
      visit login_path
      fill_in 'session_name', with: user.name
      click_button 'Log in'
      expect(page).to have_content('Logged in!') 
  end

  scenario 'show inputs' do
    visit new_event_path
    fill_in 'event_date', with: Date.today
    fill_in 'event_title', with: 'Meeting'
    fill_in 'event_location', with: 'Lagos'
    fill_in 'event_description', with: 'Second meeting'
    click_button 'Submit'
    visit root_path
    click_on 'Check attendee here'
    expect(page).to have_content('Meeting')
  end
end