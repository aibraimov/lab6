class CreateTblProductCategories < ActiveRecord::Migration
  def up
    create_table :tbl_product_categories do |t|
    	t.string :title
    end
  end
end
