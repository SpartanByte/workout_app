class ExercisesController < ApplicationController

    def index
        
    end

    def new
        @exercise = current_user.exercises.new
    end

    def create
        @exercise = current_user.exercises.new(exercise_params)

        if @exercise.save
            redirect_to [current_user, @exercise], notice: "Exercise has been created"
        else
            redirect_to [current_user, @exercise], alert: "Exercise has not been created"
        end
    end

    protected
    def exercise_params
        params.require(:exercise).permit(:duration_in_min, :workout, :workout_date)
    end
end
