class DoctorsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def show
    @doctor = Doctor.find(params[:id])
  end

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctor_path
    else
      render :new
    end
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      redirect_to doctor_path(@doctor)
    else
      render :edit
    end
  end

  def destroy
    @doctor = Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path
  end

  def list_male
    @doctors = Doctor.male
  end

  def list_female
    @doctors = Doctor.female
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :address, :gender)
  end

end
