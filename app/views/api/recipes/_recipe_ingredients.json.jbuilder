json.array!(@recipe_ingredients) do |ingredient|
	json.partial!("api/recipes/ingredient", :ingredient => ingredient)
end