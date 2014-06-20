json.current_page recipes.current_page
json.per_page recipes.per_page
json.total_entries recipes.total_entries

json.models recipes do |recipe|
	json.instructions recipe.instructions
	json.user_id recipe.user_id
	json.author recipe.user.username
	json.id recipe.id
	json.dishname recipe.dishname
	json.rating recipe.rating
	json.rated recipe.rated
	json.endorsements recipe.endorsements
	json.description recipe.description
	json.recipe_ingredients recipe.recipe_ingredients
end
