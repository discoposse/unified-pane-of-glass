json.extract! reservation_owner, :id, :firstname, :lastname, :email, :created_at, :updated_at
json.url reservation_owner_url(reservation_owner, format: :json)
