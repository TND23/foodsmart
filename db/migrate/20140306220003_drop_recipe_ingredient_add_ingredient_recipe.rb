class DropRecipeIngredientAddIngredientRecipe < ActiveRecord::Migration
  def change
  	drop_table :recipes_ingredients
  	create_table :ingredients_recipes, id: false do |t|
  		t.integer :ingredient_id
  		t.integer :recipe_id
  	end
  end
end
