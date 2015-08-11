json.array!(@dashboard_posts) do |dashboard_post|
  json.extract! dashboard_post, :id, :title, :short, :desc, :topic, :image
  json.url dashboard_post_url(dashboard_post, format: :json)
end
