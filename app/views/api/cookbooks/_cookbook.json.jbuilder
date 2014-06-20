json.id cookbook.id
json.user_id cookbook.user_id
json.saved_recipes cookbook.saved_recipes
json.notes cookbook.notes
json.cookbook_recipes cookbook.cookbook_recipes do |cookbook_recipe|
	json.id cookbook_recipe.id
	json.cookbook_id cookbook.id
	json.notes cookbook_recipe.notes
	json.recipe_id cookbook_recipe.recipe_id
	json.recipe Recipe.find(cookbook_recipe.recipe_id)
end
