class CartItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :wine, :name
  has_one :user
end
