require "rails_helper"

RSpec.feature "Listing Exercises" do
    before do
        @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
        login_as(@john)

        @e1 = @john.exercises.create(duration_in_min: 20, workout: "My body building activity", workout_date: Date.today, user_id: @john.id)
        @e2 = @john.exercises.create(duration_in_min: 55, workout: "Weight lifting",workout_date: 2.days.ago, user_id: @john.id)
        @e3 = @john.exercises.create(duration_in_min: 35, workout: "Cardio", workout_date: 8.days.ago, user_id: @john.id)
    end


    scenario "show users workout for last 7 days" do
        visit '/'

        click_link "My Lounge"

        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)

        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)

        expect(page).not_to have_content(@e3.duration_in_min)
        expect(page).not_to have_content(@e3.workout)
        expect(page).not_to have_content(@e3.workout_date)
    end

    scenario "shows no exercises if none exist" do
       @john.exercises.count

        @john.exercises.each do |ex|
            ex.delete
        end
       
       visit '/'
       click_link "My Lounge"

       expect(page).to have_content("No workouts yet")
    end
end