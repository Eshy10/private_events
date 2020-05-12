require 'rails_helper'
RSpec.describe 'login followed by logout', type: :feature do
    # The user must exist so we are creating it here
    let(:user) { User.create(name: 'Gaby') }

    scenario 'login page' do
        # First we need to be in the root path
        visit login_path
        # Secondly fill in the fields in this case only the username
        fill_in 'session_name', with: user.name
        # Third we have to click the Log in button
        click_button 'Log in'
        # We give it some time to load
        sleep(3)
        # And lastly we are expecting our page to have the success message
        expect(page).to have_content('Logged in!')
        # Logging out it's much simplier after this
        
    end
end
