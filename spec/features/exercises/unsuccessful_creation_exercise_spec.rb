require "rails_helper"

RSpec.feature "Creating Exercise - Unsuccessful" do

    scenario "with invalid inputs" do
        
        visit "/"

        click_link "My Lounge"
        click_link "New Workout"
        expect(page).to have_link("Back")

        fill_in "Duration", with: ""
        fill_in "Workout Details", with: ""
        fill_in "Activity Date", with: ""

        click_button "Create Exercise"

        expect(page).to have_content("Exercise has not been created")
    end
end