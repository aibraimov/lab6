class CreateTblUsers < ActiveRecord::Migration
  def change
    create_table :tbl_users do |t|
    	t.string 	:email
    	t.string 	:username
    	t.string 	:surname
    	t.string 	:password
    	t.integer 	:b_type
    	t.decimal	:rating, :precision => 10, :scale => 2
    end
  end
end
