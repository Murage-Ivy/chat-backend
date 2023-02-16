class MessageSerializer < ActiveModel::Serializer
  attributes :id, :reciever, :summary

  def summary
    "#{self.object.message[0..20]}..."
  end
end
