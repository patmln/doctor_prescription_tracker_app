class PrescriptionsController < ApplicationController
    before_action :get_doctor

    def index
        @prescriptions = @doctor.prescriptions
    end

    def show
        #@id = params[:id]
        @prescription = Prescription.find(params[:id])
    end

    def new
        @prescription = @doctor.prescriptions.build
    end


    def edit
        @prescription = Prescription.find(params[:id])
    end

    def create
        #@medicine = Medicine.find(params[:id])
        @prescription = @doctor.prescriptions.build(prescription_params)
        
        if @prescription.save
            redirect_to doctor_prescriptions_path(@doctor.id)
        else
            render :new
        end
    end

    def update
        @prescription = Prescription.find(params[:id])
        if @prescription.update(prescription_params)
            redirect_to doctor_prescriptions_path(@doctor.id)
        else
            render :edit
        end
    end

    def destroy
        @prescription = Prescription.find(params[:id])
        @prescription.destroy
        redirect_to doctor_prescriptions_path(@doctor.id)
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
