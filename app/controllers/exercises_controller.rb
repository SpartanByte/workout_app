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
            # redirect_to user_exercise_path(current_user, @exercise)
            redirect_to [current_user, @exercise]
        else
            flash.now[:alert] = "Exercise has not been created"
            render :new
        end
    end

    def exercise_params(:exercise).permit(:duration_in_min)
end
