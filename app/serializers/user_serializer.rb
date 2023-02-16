class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :email, :image
  has_many :friends

  def image
    rails_blob_path(object.image, disposition: "attachment", only_path: true) if object.image.attached?
  end
end
