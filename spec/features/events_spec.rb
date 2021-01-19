require "rails_helper"

RSpec.feature "Event features", type: :feature do

  let(:all_errors) { "Ensemble All Events My Events New Event Log Out\nHi, johnny!\nName can't be blank\nName is too short (minimum is 5 characters)\nLocation can't be blank\nLocation is too short (minimum is 5 characters)\nDate can't be blank\nName\nLocation\nDate" }
  
  context "create new event with a valid username" do
    before(:each) do
      visit "/signup"
      within("form") do
        fill_in "Username", with: "johnny"
      end
      click_button "Sign Up!"
    end
    scenario "should fail due to empty form" do
      visit "/events/new"
      click_button "Create Event"
      expect(page).to have_content all_errors
    end
    scenario "should fail due no value for name" do
      visit "/events/new"
      within("form") do
        fill_in "Location", with: "Where the rad events occur!"
        fill_in "Date", with: Time.now
      end
      click_button "Create Event"
      expect(page).to have_content "Name can't be blank"
    end
    scenario "should fail due no value for location" do
      visit "/events/new"
      within("form") do
        fill_in "Name", with: "Where the rad events occur!"
        fill_in "Date", with: Time.now
      end
      click_button "Create Event"
      expect(page).to have_content "Location can't be blank"
    end
    scenario "should fail due no value for date" do
      visit "/events/new"
      within("form") do
        fill_in "Name", with: "Where the rad events occur!"
        fill_in "Location", with: "Where the rad events occur!"
      end
      click_button "Create Event"
      expect(page).to have_content "Date can't be blank"
    end
  end
end
