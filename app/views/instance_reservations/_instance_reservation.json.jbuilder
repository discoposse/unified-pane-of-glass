json.extract! instance_reservation, :id, :reservation_owner_id, :reservable_instance_id, :created_at, :updated_at
json.url instance_reservation_url(instance_reservation, format: :json)
