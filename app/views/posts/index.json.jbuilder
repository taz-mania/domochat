json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :author_id, :is_pinned, :is_draft, :comments_count
  json.url post_url(post, format: :json)
end
