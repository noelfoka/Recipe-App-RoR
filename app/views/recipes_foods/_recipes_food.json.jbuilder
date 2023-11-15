json.extract! recipes_food, :id, :name, :measurement_unit, :price, :quantity, :created_at, :updated_at
json.url recipes_food_url(recipes_food, format: :json)
