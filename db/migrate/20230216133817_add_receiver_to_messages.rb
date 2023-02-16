class AddReceiverToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :reciever, :integer
  end
end
