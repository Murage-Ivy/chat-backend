class FriendSerializer < ActiveModel::Serializer
  attributes :id, :message_id, :user_id
end
