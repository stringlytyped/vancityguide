json.extract! poi, :id, :public, :featured, :name, :rating, :website, :price, :description, :user_id, :category, :created_at, :updated_at
json.url poi_url(poi, format: :json)
