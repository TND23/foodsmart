class AddNameToRecipeIngredient < ActiveRecord::Migration
  def change
	  	add_column :recipe_ingredients, :name, :string
  		add_column :recipe_ingredients, :description, :string
  end
end
