class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :dob, :line, :city, :state, :postal_code

  has_many :reviews
  # has_many :wines, through: :reviews
end
