class CreateTblProductAttributes < ActiveRecord::Migration
  def change
    create_table :tbl_product_attributes do |t|
    	t.integer	:product_id
    	t.integer	:attribute_id
    	t.string :value
    end
    execute <<-ENDSQL
    	alter table tbl_product_attributes
    		add constraint tbl_product_attributes_tbl_products
    			foreign key (product_id)
 				references tbl_products(id);
        alter table tbl_product_attributes
    		add constraint tbl_product_attributes_tbl_user_attributes
    			foreign key (attribute_id)
 				references tbl_user_attributes(id);
    ENDSQL
  end
end
