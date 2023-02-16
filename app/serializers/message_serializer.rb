class MessageSerializer < ActiveModel::Serializer
  attributes :id, :receiver, :summary
  belongs_to :user

  def summary
    "#{self.object.message[0..20]}..."
  end
end
