json.extract! planet, :id, :name, :galaxy, :system, :description, :body_type, :image, :price_per_night, :created_at, :updated_at
json.url planet_url(planet, format: :json)
