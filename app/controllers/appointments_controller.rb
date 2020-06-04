class AppointmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  layout 'appointment_layout'

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def new_release
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    # @appointment = appointment.find(params[:id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash.notice = "The appointment record was created successfully."
      redirect_to @appointment
    else
      flash.now.alert = @appointment.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      flash.notice = "The appointment record was updated successfully."
      redirect_to @appointment
    else
      flash.now.alert = @appointment.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    # @appointment = appointment.find(params[:id])
    # @appointment.destroy
    # redirect_to @appointment
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def appointment_params
      params.require(:appointment).permit(:appointment_type, :appointment_time, :client_id)
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def catch_not_found(e)
          Rails.logger.debug("We had a not found exception.")
          flash.alert = e.to_s
          redirect_to appointments_path
    end
end
