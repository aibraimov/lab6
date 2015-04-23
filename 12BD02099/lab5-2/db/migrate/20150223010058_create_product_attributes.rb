class CreateProductAttributes < ActiveRecord::Migration
  def up
    create_table :product_attributes do |t|
    	t.integer :product_id
    	t.integer :user_attribute_id
    	t.string :value

	    t.timestamps null: false
    end
    add_foreign_key(:product_attributes, :user_attributes, dependent: :delete)
    add_foreign_key(:product_attributes, :products, dependent: :delete)
  end

  def down
  	drop_table :product_attributes
  end
end
