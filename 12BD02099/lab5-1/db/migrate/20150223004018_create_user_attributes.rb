class CreateUserAttributes < ActiveRecord::Migration
  def up
    create_table :user_attributes do |t|
    	t.string :title
    	t.integer :user_id
    	t.integer :attribute_type_id
    	t.text :parameter

	    t.timestamps null: false
    end
    add_foreign_key(:user_attributes, :users, dependent: :delete)
    add_foreign_key(:user_attributes, :attribute_types, dependent: :delete)
  end

  def down
  	drop_table :user_attributes
  end
end
