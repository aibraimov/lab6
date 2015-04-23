class CreateProductCategories < ActiveRecord::Migration
  def up
    create_table :product_categories do |t|
    	t.string :title
    	t.string :description, :limit => 2000

	    t.timestamps null: false
    end
  end

  def down
  	drop_table :product_categories
  end
end
