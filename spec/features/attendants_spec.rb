require "rails_helper"

RSpec.feature "Attendant Features", type: :feature do
  context "register User's attendance to an event" do
    before(:each) do
      visit "/signup"
      within("form") do
        fill_in "Username", with: "johnny"
      end
      click_button "Sign Up!"
      click_button "Logout"
    end
    scenario "should fail due to username too short" do
      visit "/signup"
      within("form") do
        fill_in "Username", with: "john"
      end
      click_button "Sign Up!"
      expect(page).to have_content "Username is too short"
    end
  end
end
