class SchoolClassesController < ApplicationController
    
    def show
        @school_class = SchoolClass.find(params[:id])
    end

    def new
        @school_class = SchoolClass.new
    end

    def create
        redirect_to school_class_path(SchoolClass.create(schoolclass_params(:title, :room_number)))
    end

    def edit
        @school_class = SchoolClass.find(params[:id])
    end

    def update
        @school_class = SchoolClass.find(params[:id])
        @school_class.update(schoolclass_params(:title, :room_number))
        redirect_to school_class_path(@school_class)
    end

    private

        def schoolclass_params (*args)
            params.require(:school_class).permit(*args)
        end

end