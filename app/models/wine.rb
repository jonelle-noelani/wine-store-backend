class Wine < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    has_many :cart_items
    has_many :users, through: :cart_items

    attribute :price, :money
    def format_price
        console.log("price")
        # self.price/100
        # '%.2f' % self.price
        self.price.toFixed(2)
    end
end
