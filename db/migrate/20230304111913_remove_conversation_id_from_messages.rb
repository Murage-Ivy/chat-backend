class RemoveConversationIdFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :conversation_id, :string
  end
end
