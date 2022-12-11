json.extract! order_shoe, :id, :order_id, :shoe_id, :price, :discount, :active, :created_at, :updated_at
json.url order_shoe_url(order_shoe, format: :json)
