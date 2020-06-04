require 'rails_helper'

RSpec.describe "AppointmentsControllers", type: :request do
  describe "get appointments_path" do
    it "renders the index view " do
      FactoryBot.create_list(:appointment, 10)
      get appointments_path
      expect(response.status).to eq(200)
    end
  end

  describe "get appointment_path" do
  it "renders the :show template" do
    appointment = FactoryBot.create(:appointment)
    get appointment_path(id: appointment.id)
    expect(response.status).to eq(200)
  end
  it "redirects to the index path if the appointment id is invalid" do
    get appointment_path(id: 9999) #an ID that doesn't exist
    expect(response).to redirect_to appointments_path
  end
  end
  describe "get new_appointment_path" do
    it "renders the :new template" do
      get new_appointment_path
      expect(response.status).to eq(200)
    end
  end
  describe "get edit_appointment_path" do
    it "renders the :edit template" do
      appointment = FactoryBot.create(:appointment)
      get edit_appointment_path(id: appointment.id)
      expect(response.status).to eq(200)
    end
  end
  describe "post appointments_path with valid data" do
    it "saves a new entry and redirects to the show path for the entry" do
      appointment_attributes = FactoryBot.attributes_for(:appointment)
      expect { post appointments_path, params:{appointment: appointment_attributes}
    }.to change(Appointment, :count)
      expect(response).to redirect_to appointment_path(id: Appointment.last.id)
    end
  end
end
