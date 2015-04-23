class CreateTblAttributeTypes < ActiveRecord::Migration
  def change
    create_table :tbl_attribute_types do |t|
    	t.string :title
    end
  end
end
