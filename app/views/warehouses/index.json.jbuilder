json.array!(@warehouses) do |warehouse|
  json.extract! warehouse, :id, :product_id, :quantity
  json.url warehouse_url(warehouse, format: :json)
end
