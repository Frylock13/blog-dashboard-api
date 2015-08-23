json.array!(@posts) do |post|
  json.extract! post, :id, :title, :short, :content, :tags, :image, :created_at
end
