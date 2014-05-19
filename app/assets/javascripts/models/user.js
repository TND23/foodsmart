App.Models.User = Backbone.Model.extend({

	defaults: {
		favorited_recipes: [],
		cookbook: [],
		user_ingredients: []
	},

	initialize: function(){
		this.cookbook = new App.Models.Cookbook([], {user: this});
		this.user_ingredients = new App.Models.UserIngredients([], {user: this});
	}
});