App.Models.UserIngredient = Backbone.Model.extend({
	defaults: {
		quantity: 0,
		units: null,
		name: "ingredient",
		ingredient_id: 0
	},

	initialize: function(models, options){
		this.set("user_id", this.collection.get("user_id"));
	},

	findIngredient: function(name){
		var ingredient = App.Collections.ingredients.findWhere({"name": name});
		if (ingredient !== undefined){
			this.set("ingredient_id", ingredient.id);
			return true;
		} else {
			return false;
		}
	},

	validate: function(){
		var name = this.get("name");
		if (this.findIngredient(name)){
			return true;
		} 
		// todo: logic
		// else {
			// this.ingredient = []
		// }
			
	}
});