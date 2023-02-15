class AddFriendsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :friend, :integer
  end
end
