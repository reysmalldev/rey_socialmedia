class User::Post < ApplicationRecord
  belongs_to :user

  has_many         :likes,    class_name: 'User::Post::Like',    foreign_key: 'user_post_id'
  has_many         :comments, class_name: 'User::Post::Comment', foreign_key: 'user_post_id'
  has_one_attached :image_poster
end
