require "rails_helper"

RSpec.feature "Creating Exercise" do
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
        login_as(@john)
    end

    scenario "with valid inputs" do
        
        visit "/"

        click_link "My Lounge"
        click_link "New Workout"
        expect(page).to have_link("Back")

        fill_in "Workout Duration", with: 70
        fill_in "Workout Description", with: "Weight lifting"

        select "2020", :from => "exercise[workout_date(1i)]"
        select "June", :from => "exercise[workout_date(2i)]"
        select "9", :from => "exercise[workout_date(3i)]"
        expect(page).to have_select('exercise[workout_date(1i)]', selected: '2020')
        click_button "Create Exercise"

        expect(page).to have_content("Exercise has been created")

        exercise = Exercise.last
        expect(current_path).to eq(user_exercise_path(@john, exercise))
        expect(exercise.user_id).to eq(@john.id)
    end
end