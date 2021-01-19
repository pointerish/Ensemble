require 'rails_helper'

RSpec.feature 'User Features', type: :feature do
  context 'create new user with a valid username' do
    scenario 'should fail due to username too short' do
      visit '/signup'
      within('form') do
        fill_in 'Username', with: 'john'
      end
      click_button 'Sign Up!'
      expect(page).to have_content 'Username is too short'
    end
    scenario 'should fail due to username too long' do
      visit '/signup'
      within('form') do
        fill_in 'Username', with: 'johnnyisafantasticteamplayer'
      end
      click_button 'Sign Up!'
      expect(page).to have_content 'Username is too long'
    end
    scenario 'should succeed due to valid username' do
      visit '/signup'
      within('form') do
        fill_in 'Username', with: 'johnny'
      end
      click_button 'Sign Up!'
      expect(page).to have_content 'Hi, johnny!'
    end
  end
end
