App.Routers.AppRouter = Backbone.Router.extend({

	routes: {
		"" : "root",
		"fridge" : "userIngredientIndex",
		"ingredients" : "ingredientIndex",
		"recipes" : "recipeIndex",
		"recipesCreate" : "recipeNew"
	},

	root: function(){
		Backbone.history.navigate("#", {trigger: true});
	},

	ingredientIndex: function(){
		//refactor
		var collection = App.Collections.ingredients;		
		collection.fetch({ 
			success: function(){
				var newView = new App.Views.IngredientsIndex( { collection: App.Collections.ingredients } );
				newView.render();
			}
		})
	},

	recipeIndex: function(){
		var collection = App.Collections.recipes;
		collection.fetch({
			success: function(){ 
				var newView = new App.Views.RecipesIndex({ collection: App.Collections.recipes });				
				newView.render();
			}
		})
	},

	recipeNew: function(){
		var newView = new App.Views.RecipeNew();
		var recipe = new App.Models.Recipe();
		$("body").html(newView.render().el);
				// var newView = new App.Views.RecipeNew();
		// var recipe = new App.Models.Recipe();
		// var form = new Backbone.Form({model: recipe}).render();
		// $("body").html(form.el);
	},

	userIngredientIndex: function(){
		var newView = new App.Views.UserIngredientsIndex({
			collection: App.Collections.UserIngredients
		})
	},

});