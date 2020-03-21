json.extract! patient, :id, :birthday, :name, :timeToDoc, :phone, :email, :created_at, :updated_at
json.url patient_url(patient, format: :json)
