App.Routers.AppRouter = Backbone.Router.extend({

	routes: {
		"" : "root",
		"home" : "showHome",
		"fridge" : "userIngredientIndex",
		"ingredients" : "ingredientIndex",
		"ingredientNew" : "ingredientNew",
		"recipes" : "recipeIndex",
		"recipesCreate" : "recipeCreate",
		"recipeNew" : "recipeNew",
		"recipes/:id" : "recipeShow"
	},

	root: function(e){
		Backbone.history.navigate("#/home", {trigger: true});
	},

	showHome: function(){
		var newView = new App.Views.Error({err: "Nothing"});
		this._swapView(newView);
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
		// later on only admins can add ingredients, (since they are global resources)
		// if (App.current_user.get("admin") == true){
			var newView = new App.Views.IngredientNew();
			var newContent = newView.render();
			$("#content").html(newContent.el);			
		// }
		// else{
		// 	var newView = new App.Views.Error({err: "notAdmin"});
		// 	var err = newView.err;
		// 	var newContent = newView.render(err);
		// 	$("#content").html(newContent.el);			
		// }
	},

	recipeIndex: function(){
		var collection = App.Collections.recipes;
		var that = this;
		collection.fetch({
			success: function(){ 
				var newView = new App.Views.RecipesIndex({ collection: App.Collections.recipes }).render();				
				that._swapView(newView);
			}
		})			
	},

	recipeNew: function(){
		var newView = new App.Views.RecipeNew();
		var newContent = newView.render();
		$("#content").html(newContent.el);
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

	renderShow: function(recipe){
		var newView = new App.Views.RecipesShow({model: recipe});
		var newContent = newView.render();
		$("#content").html(newContent.el);	
	},

	userIngredientIndex: function(){
		if (App.Collections.user_ingredients === undefined){
			App.Collections.user_ingredients = new App.Collections.UserIngredients();
			App.Collections.user_ingredients.fetch();	
		}
		var newView = new App.Views.UserIngredientsIndex({
			collection: App.Collections.user_ingredients
		})
		var newContent = newView.render();
		$("#content").html(newContent.el);	
	},

	_swapView: function (newView) {
	  if (this._prevView) {
	    this._prevView.remove();
	  }
	  this._prevView = newView;
	  $("#content").html(newView.render().$el);
  }

});