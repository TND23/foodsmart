json.array!(@recipe_ingredientss) do |recipe_ingredient|
	json.partial!("api/recipe_ingredients/recipe_ingredient", :recipe_ingredient => recipe_ingredient)
end
