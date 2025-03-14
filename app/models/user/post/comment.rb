class User::Post::Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user_post, class_name: 'User::Post', foreign_key: 'user_post_id'

  validates :content, presence: true
end
