class UserSerializer < ActiveModel::Serializer
  attributes :id, :reviews

  # has_many :reviews
  # has_many :wines, through: :reviews
end
