class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
        t.string    :title
        t.integer   :product_category_id
        t.string    :sku
        t.string    :description, :limit => 2000
        t.string    :short_description
        t.boolean   :active
        t.decimal   :price, :precision => 10, :scale => 2

        t.timestamps null: false
    end
    add_foreign_key(:products, :product_categories, dependent: :delete)
  end

  def down
    drop_table :products
  end
end
