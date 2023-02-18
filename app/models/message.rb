class Message < ApplicationRecord
  validates :message, presence: :true
  has_many :messages 
end
