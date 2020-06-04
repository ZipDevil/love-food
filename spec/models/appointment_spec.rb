require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject {Appointment.new( appointment_type: "Donate", appointment_time: "2020-06-12 09:30:00 UTC", client: FactoryBot.create(:client))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without an appointment_type" do
    subject.appointment_type = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a client" do
    subject.client = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a valid client_id" do
    subject.client_id = 0.1
    expect(subject).to_not be_valid
  end
end
