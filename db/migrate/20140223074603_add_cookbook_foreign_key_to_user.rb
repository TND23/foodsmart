class AddCookbookForeignKeyToUser < ActiveRecord::Migration
  def change
  	  	add_column :users, :cookbook_id, :integer
  end
end
