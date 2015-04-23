class AddProductsUserId < ActiveRecord::Migration
  def change
  	add_column :products, :user_id, :integer
    add_foreign_key(:products, :users, dependent: :delete)
  end
end
