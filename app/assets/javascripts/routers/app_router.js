App.Routers.AppRouter = Backbone.Router.extend({

	routes: {
		"" : "root",
		"fridge" : "userIngredientIndex",
		"ingredients" : "ingredientIndex",
		"recipes" : "recipeIndex"
	},

	root: function(){
		Backbone.history.navigate("#");
	},

	ingredientIndex: function(){
		var newView = new App.Views.IngredientsIndex({
			collection: App.Collections.ingredients
		});

		newView.render();
	},

	recipeIndex: function(){
		var newView = new App.Views.RecipesIndex({
			collection: App.Collections.recipes
		});
	},

	userIngredientIndex: function(){
		var newView = new App.Views.UserIngredientsIndex({
			collection: App.Collections.UserIngredients
		})
	},


});