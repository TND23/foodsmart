class CreateCookBooks < ActiveRecord::Migration
  def change
    create_table :cook_books do |t|
    	t.integer :user_id
    	t.integer :recipe_id
    	t.string :saved_recipes
    	t.string :notes
    	t.timestamps
    end
  end
end
