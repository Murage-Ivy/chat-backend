class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.integer :message_id
      t.integer :user_id

      t.timestamps
    end
  end
end
