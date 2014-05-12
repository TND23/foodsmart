App.Routers.AppRouter = Backbone.Router.extend({

	initialize: function(){
		this.cached = {
			view: undefined,
			model: undefined
		}
	},

	routes: {
		"" : "root",
		"fridge" : "userIngredientIndex",
		"ingredients" : "ingredientIndex",
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
				this.navigate("#/recipes", {trigger: true});

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
			}
		})			
		}
		else {
			$("body").html(that.cached.view.el);
		}

		Backbone.history.navigate("/recipes");
	},

	recipeNew: function(){
		// step 1: create a staging area
		var newView = new App.Views.RecipeNew();
		var newContent = newView.render();
		$("body").html(newContent.el);

		// var recipe = new App.Models.Recipe();
		// // $("body").html(newView.render().el);
		// var newView = new App.Views.RecipeNew();
		// var form = new App.Forms.RecipeForm({model: recipe}).render();
		// $("body").html(form.el);
	},

	recipeShow: function(identification){
		var identification = parseInt(identification);
		App.Collections.recipes.fetch( 
			{ success: function(){
					var recipe = App.Collections.recipes.where({id: identification});
					var newView = new App.Views.RecipesShow({model: recipe});
					App.thang = newView;
					var newContent = newView.render();
					$("body").html(newContent.el);			
				}
		});
	},

	recipeCreate: function(){

	},

	userIngredientIndex: function(){
		var newView = new App.Views.UserIngredientsIndex({
			collection: App.Collections.UserIngredients
		})
	},

});