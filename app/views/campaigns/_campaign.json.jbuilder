json.extract! campaign, :id, :name, :title, :body, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)