App.Models.Ingredient = Backbone.Model.extend({
	urlRoot: "/api/ingredients",

	user_ingredients: function(){
		if (!this._user_ingredients){
			this._user_ingredients = new App.Collections.UserIngredients([], {ingredient: this});
		}
		return this._user_ingredients;
	},
	initialize: function(models, options){
		
	}
});
