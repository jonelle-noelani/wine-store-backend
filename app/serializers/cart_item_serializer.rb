class CartItemSerializer < ActiveModel::Serializer
  attributes :id
  has_one :wine
  has_one :user
end
