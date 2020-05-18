class ExercisesController < ApplicationController

    def index
        
    end

    def new
        @exercise = current_user.exercises.new
    end

    def create
        @exercise = current_user.exercises.new(exercise_params)

        if @exercise.save
            flash[:notice] = "Exercise has been created"
            redirect_to [current_user, @exercise]
        else
            flash[:alert] = "Exercise has not been created"
            redirect_to [current_user, @exercise]
        end
    end

    protected
    def exercise_params
        params.require(:exercise).permit(:duration_in_min, :workout, :workout_date)
    end
end