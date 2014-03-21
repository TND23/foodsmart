class CreateUserIngredients < ActiveRecord::Migration
  def change
    create_table :user_ingredients do |t|
    	t.integer :user_id
    	t.integer :ingredient_id
    	t.float :quantity
    	t.string :units
    end
  end
end
