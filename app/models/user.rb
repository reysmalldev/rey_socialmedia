class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one :config, dependent: :destroy
  has_many :posts
  has_many :friend_ships
  has_many :received_friend_ships, class_name: "User::FriendShip", foreign_key: "target_user_id"

  validates :email_address, uniqueness: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  broadcasts_refreshes

  def self.find_by_username(username = nil)
    User::Config.find_by(username: username)&.user
  end

  def as_json(options = {})
    hash_user = super(options.merge(only: [:id, :email_address]))
    hash_user[:avatar] = self.config.avatar
    hash_user[:username] = self.config.username
    hash_user.with_indifferent_access
  end

  def username
    self.config.username
  end

  def friends
    self.friend_ships.where(acceptance: true).map(&:target_user) + self.received_friend_ships.where(acceptance: true).map(&:user)
  end

  def are_friend?(user)
    friends.find { |f| f.id == user&.id } ? true : false
  end

  def has_pending_request_from?(user)
    self.received_friend_ships.where(user_id: user.id, acceptance: nil)&.size&.positive?
  end

  def has_reject_request_from?(user)
    self.received_friend_ships.where(user_id: user.id, acceptance: false)&.size&.positive?
  end

  after_create do |user|
    UserMailer.welcome_email(user).deliver_now!
  end
end
