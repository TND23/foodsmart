App.Routers.AppRouter = Backbone.Router.extend({
	// re-work paperclip 
	routes: {
		"" : "root",
		"cookbookRecipes": "cookbookRecipesIndex",
		"home" : "showHome",
		"fridge" : "userIngredientIndex",
		"ingredients" : "ingredientIndex",
		"ingredientNew" : "ingredientNew",
		"recipeNew" : "recipeNew",
		"recipes/:id" : "recipeShow",
		"recipes/page/:id" : "recipeIndex"
	},

	root: function(){
		// set the 'root' of the app at #/home
		Backbone.history.navigate("#/home", {trigger: true});
	},

	showHome: function(){
		//TODO: fix back button
		var newView = new App.Views.Root();
		this._swapView(newView);
	},

	cookbookRecipesIndex: function(){
		var that = this;
		var cookbook = App.current_user.cookbook;
		var collection = cookbook.cookbook_recipes;
		collection.fetch({ 
			success: function(){
				var newView = new App.Views.CookbookRecipesIndex({collection: collection});
				that._swapView(newView);
			}
		});
	},

	ingredientIndex: function(e){
		var that = this;
		e.preventDefault();
		var collection = App.Collections.ingredients;		
		collection.fetch({ 
			success: function(){
				var newView = new App.Views.IngredientsIndex( { collection: App.Collections.ingredients } );
				that._swapView(newView);
			}
		})
	},

	ingredientNew: function(){
		// later on only admins can add ingredients, (since they are global resources)
		// if (App.current_user.get("admin") == true){
			var newView = new App.Views.IngredientNew();
			this._swapView(newView);
		// }
		// else{
		// 	var newView = new App.Views.Error({err: "notAdmin"});
		// 	var err = newView.err;
		// 	var newContent = newView.render(err);
		// 	$("#content").html(newContent.el);			
		// }
	},

	recipeIndex: function(pg){
		var that = this;
		var pg = parseInt(pg);
		var collection = App.Collections.recipes;
		collection.getPage(pg);
		collection.fetch({
			success: function(){ 
				var newView = new App.Views.RecipesIndex({ collection: App.Collections.recipes });		
				that._swapView(newView);
			}
		});
	},

	recipeNew: function(){
		var newView = new App.Views.RecipeNew();
		this._swapView(newView);
	},

	recipeShow: function(identification){
		var that = this;
		var identification = parseInt(identification); // since the identification is passed in as a string
		if (App.Collections.recipes.models.length === 0){ // if the recipeCollection hasn't been stored, store it
			App.Collections.recipes.fetch({
				success: function(){ 
					var recipe = App.Collections.recipes.get(identification);
					that.getEndorsements(recipe);
				}
			}) 
		} else {
			var recipe = App.Collections.recipes.get(identification);
			this.getEndorsements(recipe);
		}
	},

	getEndorsements: function(recipe){
		var that = this;
		recipe.endorsements.fetch({success: function(){
			that.renderShow(recipe);
		}});
	},

	renderShow: function(recipe){
		var newView = new App.Views.RecipesShow({model: recipe});
		this._swapView(newView);
	},

	userIngredientIndex: function(){
		if (App.Collections.user_ingredients === undefined){
			App.Collections.user_ingredients = new App.Collections.UserIngredients([], {user: App.current_user});
			App.Collections.user_ingredients.fetch();	
		}
		var newView = new App.Views.UserIngredientsIndex({
			collection: App.Collections.user_ingredients
		})
		this._swapView(newView);
	},

	_swapView: function (newView) {
	  if (this._prevView) {
	    this._prevView.remove();
	  }
	  this._prevView = newView;
	  $("#content").html(newView.render().$el);
  }
});