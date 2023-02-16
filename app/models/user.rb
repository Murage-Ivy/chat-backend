class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..8 }
  validates :password_confirmation, presence: true, length: { in: 6..8 }
  validates :image, attached: true
  has_many :friends, dependent: :destroy
  # has_many :messages, dependent: :destroy
end
