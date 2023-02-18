class UserMessageSerializer < ActiveModel::Serializer
  attributes :id, :sender, :reciever, :message
end
