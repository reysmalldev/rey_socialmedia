class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :config
  has_many :posts
  has_many :friend_ships

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
