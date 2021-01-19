require "rails_helper"

RSpec.feature "Attendant Features", type: :feature do
  context "register User's attendance to an event" do
    before(:each) do
      FactoryBot.create(:user)
      FactoryBot.create(:event)
    end
    scenario "should register current user's attendance to event" do
      visit "/login"
      within("form") do
        fill_in "Username", with: "pointerish"
      end
      click_button "Let me in!"
      visit "/events/1"
      click_link("I'm attending!")
      visit "users/1"
      expect(page).to have_content "A rad sick event!"
    end
  end
end
