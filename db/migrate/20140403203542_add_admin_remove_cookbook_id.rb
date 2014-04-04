class AddAdminRemoveCookbookId < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean, :default => false
  	remove_column :users, :cookbook_id
  end
end
