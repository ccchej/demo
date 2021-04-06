class ProductReference < ApplicationRecord
    belongs_to :product
    belongs_to :reference
end
