json.extract! user, :id, :name, :city, :country, :mobile, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
