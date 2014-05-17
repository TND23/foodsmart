App.Routers.AppRouter = Backbone.Router.extend({

	initialize: function(){
		this.cached = {
			view: undefined,
			recipeCollection: undefined
		}
	},

	routes: {
		"" : "root",
		"fridge" : "userIngredientIndex",
		"ingredients" : "ingredientIndex",
		"ingredientNew" : "ingredientNew",
		"recipes" : "recipeIndex",
		"recipesCreate" : "recipeCreate",
		"recipeNew" : "recipeNew",
		"recipes/:id" : "recipeShow"
	},

	root: function(e){
		var newView = new App.Views.Root();
		var newContent = newView.render();
		$('body').html(newContent.el);
		Backbone.history.navigate("#");
	},

	ingredientIndex: function(e){
		//refactor
		e.preventDefault();
		var collection = App.Collections.ingredients;		
		collection.fetch({ 
			success: function(){
				var newView = new App.Views.IngredientsIndex( { collection: App.Collections.ingredients } );
				newView.render();
			}
		})
	},

	ingredientNew: function(){
		var newView = new App.Views.IngredientNew();
	},

	recipeIndex: function(){
		var that = this;
		if (this.cached.view === undefined){
			var collection = App.Collections.recipes;
			var newView;
			collection.fetch({
				success: function(){ 
				// new instance of recipe_index.js
				that.cached.view = newView = new App.Views.RecipesIndex({ collection: App.Collections.recipes }).render();				
				$("body").html(newView.el);
				that.cached.recipeCollection = collection;
			}
		})			
		} else {
			$("body").html(that.cached.view.el);
		}

		Backbone.history.navigate("/recipes");
	},

	recipeNew: function(){
		var newView = new App.Views.RecipeNew();
		var newContent = newView.render();
		$("body").html(newContent.el);
	},

	recipeShow: function(identification){
		var that = this;
		
		var identification = parseInt(identification); // since the identification is passed in as a string
		if (App.Collections.recipes.models.length === 0){ // if the recipeCollection hasn't been stored, store it
			App.Collections.recipes.fetch({
				success: function(){ 
					var recipe = App.Collections.recipes.where({id: identification});
					that.renderShow(recipe);
				}
			}) 
		} else {
			var recipe = App.Collections.recipes.where({id: identification});
			this.renderShow(recipe);
		}
	},

	recipeCreate: function(){

	},

	renderShow: function(recipe){
		var newView = new App.Views.RecipesShow({model: recipe});
		var newContent = newView.render();
		$("body").html(newContent.el);	
	},

	userIngredientIndex: function(){
		var newView = new App.Views.UserIngredientsIndex({
			collection: App.Collections.UserIngredients
		})
	}

});