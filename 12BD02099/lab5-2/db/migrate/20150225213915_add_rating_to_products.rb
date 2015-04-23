class AddRatingToProducts < ActiveRecord::Migration
  def change
    add_column :products, :rating, :integer
    add_column :products, :votes, :integer
    add_column :users, :votes, :integer
  end
end
