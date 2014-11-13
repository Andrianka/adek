json.array!(@products) do |product|
  json.extract! product, :id, :product_key, :name, :price
  json.url product_url(product, format: :json)
end
