class Friend < ApplicationRecord
  validates :name, presence: :true
  validates :email, presence: :true
  belongs_to :user
end
