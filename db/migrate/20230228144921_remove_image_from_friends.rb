class RemoveImageFromFriends < ActiveRecord::Migration[7.0]
  def change
    remove_column :friends, :image, :string
  end
end
