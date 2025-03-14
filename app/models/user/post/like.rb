class User::Post::Like < ApplicationRecord
  belongs_to :post, class_name: 'User::Post', foreign_key: 'user_post_id'
  belongs_to :user
end
