class CreateRecipeCookBooksJoinTable < ActiveRecord::Migration
  def change
  	  	create_table :recipes_cookbooks, id: false do |t|
  		t.integer :recipe_id
  		t.integer :cookbook_id
  	end
  end
end
