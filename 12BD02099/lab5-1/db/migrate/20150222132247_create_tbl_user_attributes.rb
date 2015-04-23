class CreateTblUserAttributes < ActiveRecord::Migration
  def change
    create_table :tbl_user_attributes do |t|
    	t.integer :user_id
    	t.integer :type_id
    	t.string 	:title
    	t.text		:parameter
    end
    execute <<-ENDSQL
    	alter table tbl_user_attributes
    		add constraint tbl_user_tbl_attributes
    			foreign key (user_id)
 				references tbl_users(id);
        alter table tbl_user_attributes
    		add constraint tbl_attribute_tbl_types
    			foreign key (type_id)
 				references tbl_attribute_types(id);
    ENDSQL
  end
end
