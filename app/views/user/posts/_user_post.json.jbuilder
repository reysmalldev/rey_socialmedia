json.extract! user_post, :id, :title, :content, :user_id, :created_at, :updated_at
json.url user_post_url(user_post, format: :json)
