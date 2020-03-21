json.extract! appointment, :id, :datetime, :status, :classification, :remarks, :sortOrder, :patient_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
