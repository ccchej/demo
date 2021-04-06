class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :reference_id
      t.integer :category_id
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    create_table :references do |t|
      t.string :name

      t.timestamps
    end

    create_table :product_references do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :reference, foreign_key: true

      t.timestamps
    end

    create_table :product_categories do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :category, foreign_key: true

      t.timestamps
    end
  end
end
