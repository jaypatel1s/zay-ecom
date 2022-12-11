json.extract! order, :id, :user_id, :total, :discount, :created_at, :updated_at
json.url order_url(order, format: :json)
