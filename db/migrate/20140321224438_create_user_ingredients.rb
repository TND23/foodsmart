class CreateUserIngredients < ActiveRecord::Migration
  def change
    create_table :user_ingredients do |t|
    	t.integer :user_id, :null => false
    	t.integer :ingredient_id, :null => false
    	t.float :quantity
    	t.string :units
    	t.string :name, :null => false
    end
    add_index :user_ingredients, :user_id
    add_index :user_ingredients, :ingredient_id
  end
end
