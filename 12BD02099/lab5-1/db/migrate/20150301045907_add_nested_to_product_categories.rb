class AddNestedToProductCategories < ActiveRecord::Migration
  def change
      add_column :product_categories, :parent_id, :integer, :null => true, :index => true
      add_column :product_categories, :lft, :integer, :null => true, :index => true
      add_column :product_categories, :rgt, :integer, :null => true, :index => true
      # optional fields
      add_column :product_categories, :depth, :integer, :null => true
      add_column :product_categories, :children_count, :integer, :null => true
  end
end
