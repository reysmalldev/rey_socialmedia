class User::Config < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  broadcasts_refreshes_to :user

  validates :username, presence: true, uniqueness: true
end
