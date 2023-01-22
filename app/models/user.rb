class User < ApplicationRecord
  has_secure_password
  validates :username, presence: :true, uniquness: :true
  validates :email, presence: :true, uniqueness: :true
  validates :password, presence: :true, length: { in: 6..8 }
  validates :password_confirmation, presence: :true, length: { in: 6..8 }
  has_many :messages, dependent: :destroy
end
