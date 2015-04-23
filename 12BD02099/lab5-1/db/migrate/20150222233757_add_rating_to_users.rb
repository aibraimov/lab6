class AddRatingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rating, :decimal, :precision => 10, :scale => 2, :default => 10
    add_column :users, :b_type, :integer, :limit => 1
  end
end
