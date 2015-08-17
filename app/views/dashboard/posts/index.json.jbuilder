json.array!(@dashboard_posts) do |dashboard_post|
  json.extract! dashboard_post, :id, :title, :short, :content, :tag, :image, :created_at
  json.url dashboard_post_url(dashboard_post, format: :json)
end
