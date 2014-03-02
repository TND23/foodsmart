class DropCookBookAddCookbook < ActiveRecord::Migration
  def change
    create_table :cookbooks do |t|
	  t.integer :user_id
	  t.integer :recipe_id
	  t.string :saved_recipes
	  t.text :notes
	  t.timestamps
	end
	drop_table :cook_books
  end
end
