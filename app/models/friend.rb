class Friend < ApplicationRecord
  validates :name, presence: :true, uniqueness: :true
  validates :email, presence: :true, uniqueness: :true
  belongs_to :user
end
