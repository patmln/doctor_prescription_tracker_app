class MedicinesController < ApplicationController
    before_action :set_medicine, only: [:show, :edit, :update, :destroy]

    def index
        @medicines = Medicine.all
    end

    def show
        #@id = params[:id]
    end

    def new
        @medicine = Medicine.new
    end

    def edit
    end
    
    def create
        @medicine = Medicine.new(medicine_params)
        if @medicine.save
            redirect_to @medicine
        else
            render :new
        end
    end

    def update
        if @medicine.update(medicine_params)
            redirect_to @medicine
        else
            render :edit
        end
    end

    def destroy
        @medicine.destroy
        redirect_to medicines_path
    end

    private

    def set_medicine
        @medicine = Medicine.find(params[:id])
    end

    def medicine_params
        params.require(:medicine).permit(:name, :price)
    end
end
