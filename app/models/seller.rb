class Seller < ApplicationRecord
    has_many :houses

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
