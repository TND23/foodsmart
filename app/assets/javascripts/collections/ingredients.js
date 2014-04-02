RecipeSwap.Collections.Ingredients = Backbone.Collection.extend({
	url: "/api/ingredients",
	model: RecipeSwap.Models.Ingredient
});