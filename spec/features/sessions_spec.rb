require "rails_helper"

RSpec.feature "Session Features", type: :feature do
  context "logs the user out" do
    before(:each) do
      User.create(username: "pointerish")
    end
    scenario "should log the user out" do
      visit "/login"
      within("form") do
        fill_in "Username", with: "pointerish"
      end
      click_button "Let me in!"
      click_link("Log Out")
      expect(page).to have_content "Log In"
    end
  end
end
