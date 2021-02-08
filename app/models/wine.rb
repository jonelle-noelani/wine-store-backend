class Wine < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    has_many :cart_items
    has_many :users, through: :cart_items

    attribute :price, :money
end
