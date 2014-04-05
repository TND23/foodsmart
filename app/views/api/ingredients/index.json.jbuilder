json.array!(@ingredients) do |ingredient|
	json.partial!("api/ingredients/ingredient", :ingredient => ingredient)
end