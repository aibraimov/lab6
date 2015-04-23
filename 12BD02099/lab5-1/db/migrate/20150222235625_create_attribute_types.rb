class CreateAttributeTypes < ActiveRecord::Migration
  def up
    create_table :attribute_types do |t|
    	t.string 	:title
	    t.timestamps null: false
    end
  end

  def down
  	drop_table :attribute_types
  end
end
