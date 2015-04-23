class CreateTblProducts < ActiveRecord::Migration
  def change
    create_table :tbl_products do |t|
    	t.string :title
    	t.decimal :rating, :precision=>10, :scale=>2
    	t.integer :category
    end
    execute <<-ENDSQL
    	alter table tbl_products
    		add constraint tbl_products_tbl_categories
    			foreign key (category)
 				references tbl_product_categories(id)
    ENDSQL
  end
end
