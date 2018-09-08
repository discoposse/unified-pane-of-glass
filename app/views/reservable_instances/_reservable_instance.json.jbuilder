json.extract! reservable_instance, :id, :name, :vm, :created_at, :updated_at
json.url reservable_instance_url(reservable_instance, format: :json)
