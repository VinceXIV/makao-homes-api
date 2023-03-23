class Seller < ApplicationRecord
    has_many :houses

    has_secure_password

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
