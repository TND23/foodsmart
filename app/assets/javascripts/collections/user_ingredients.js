RecipeSwap.Collections.UserIngredients = Backbone.Collection.extend({
	model: RecipeSwap.Models.UserIngredient,

	url: function(){
		return "api/users/" + this.user.get("id") + "/user_ingredients"; 
	},

	initialize: function(options){
		this.userIngredient = options.userIngredient;
	}
});