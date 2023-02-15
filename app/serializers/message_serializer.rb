class MessageSerializer < ActiveModel::Serializer
  attributes :id, :message, :receiver, :sender
  belongs_to :user
end
