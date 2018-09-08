json.extract! object_owner, :id, :firstname, :lastname, :email, :created_at, :updated_at
json.url object_owner_url(object_owner, format: :json)
