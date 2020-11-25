class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :wines, through: :reviews

    has_many :cart_items, dependent: :destroy
    has_many :wines, through: :cart_items

    has_secure_password
    
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6}
end
