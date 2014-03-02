class DropCookBookFromUsers < ActiveRecord::Migration
  def change
  	  	remove_column :users, :cook_book

  end
end
