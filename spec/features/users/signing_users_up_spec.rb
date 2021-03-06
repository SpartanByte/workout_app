require "rails_helper"

RSpec.feature "Users Sign up" do
    
    scenario do
        visit '/'
        click_link "Sign up"
        fill_in "First name", with: "John"
        fill_in "Last name", with: "Wick"
        fill_in "Email", with: "wick@example.com"
        fill_in "Password",  with: "password"
        fill_in "Password confirmation",  with: "password"
        click_button "Sign up"

        expect(page).to have_content("You have signed up successfully.")
    end
end