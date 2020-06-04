class Appointment < ApplicationRecord
  belongs_to :client
  validates_presence_of :client
  TYPE = ["Volunteer","Donate Food", "Bulk Donation", "Request a Drop-off"]
  validates :appointment_type, presence: true
  validates :appointment_time, presence: true
end
