class PrescriptionsController < ApplicationController
    before_action :get_doctor

    def index
        @prescriptions = @doctor.prescriptions
    end

    def new
        @prescription = @doctor.prescriptions.build
    end

    def create
        @prescription = @doctor.prescriptions.build(prescription_params)

        if @prescription.save
            redirect_to doctor_prescriptions_path(@doctor.id)
        else
            render :new
        end
    end

    private

    def get_doctor
        @doctor = Doctor.find(params[:doctor_id])
    end

    def prescription_params
        params.require(:prescription).permit(:title,:date,:medicine,:price,:quantity,:notes,:doctor_id)
    end
    #pwedeng walang :doctor_id
end
