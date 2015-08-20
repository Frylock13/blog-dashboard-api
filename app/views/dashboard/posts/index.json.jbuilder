json.array!(@posts) do |post|
  json.extract! post, :id, :title, :short, :content, :tag, :image, :created_at
end
