class DropCookbookId < ActiveRecord::Migration
  def change
  	remove_column :users, :integer, :cookbook_id
  end
end
