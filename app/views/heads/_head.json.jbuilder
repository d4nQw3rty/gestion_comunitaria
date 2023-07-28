json.extract! head, :id, :cedula, :name, :sur_name, :birthdate, :user_id, :created_at, :updated_at
json.url head_url(head, format: :json)
