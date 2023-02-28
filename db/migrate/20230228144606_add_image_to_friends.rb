class AddImageToFriends < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :image, :string
  end
end
