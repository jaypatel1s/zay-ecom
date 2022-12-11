json.extract! cart, :id, :user_id, :shoe_id, :quantity, :size, :created_at, :updated_at
json.url cart_url(cart, format: :json)
