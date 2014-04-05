json.(@user_ingredients) do |user_ingredient|
	json.(user_ingredient, :user_id, :ingredient_id, :name, :quantity, :units)
end