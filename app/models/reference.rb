class Reference < ApplicationRecord
    has_many :product_references
    has_many :products, through: :product_references
end
