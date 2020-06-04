json.extract! appointment, :id, :appointment_type, :appointment_time, :updated_at
json.url appointment_url(appointment, format: :json)
