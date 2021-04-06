class Product < ApplicationRecord
    has_many :product_categories, dependent: :destroy 
    has_many :product_references, dependent: :destroy 
    has_many :categories, through: :product_categories
    has_many :references, through: :product_references

    def self.category_with(name)
        Category.find_by!(name: name).products
    end

    def category_list
        categories.map(&:name).join(', ')
    end

    def category_list=(names)
        self.categories = names.split(',').map do |n|
            Category.where(name: n.strip).first_or_create!
        end
    end

    def self.reference_with(name)
        Reference.find_by!(name: name).products
    end

    def reference_list
        references.map(&:name).join(', ')
    end

    def reference_list=(names)
        self.references = names.split(',').map do |n|
            Reference.where(name: n.strip).first_or_create!
        end
    end
end
