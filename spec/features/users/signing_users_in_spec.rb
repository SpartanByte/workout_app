require "rails_helper"

RSpec.feature "Users Sign in" do
    
    before do
        @john = User.create(email: "test1@example.com", password: "password", first_name: "Test", last_name: "One")
    end

    scenario do
        visit '/'
        click_link "Sign up"
        fill_in "Email", with: @john.email
        fill_in "Password",  with: @john.password
        puts "Email is #{@john.email}"
        click_link "Log in"

        expect(page).to have_content("Signed in successfully.")
        expect(page).to have_content("Signed in as #{@john.email}")
    end
end