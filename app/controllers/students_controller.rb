class StudentsController < ApplicationController

    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
    end

    def create
        redirect_to student_path(Student.create(student_params(:first_name, :last_name)))
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        @student = Student.find(params[:id])
        @student.update(student_params(:first_name, :last_name))
    end

    private

        def student_params(*args)
            params.require(:student).permit(*args)
        end

end