App.Models.UserIngredient = Backbone.Model.extend({
	defaults: {
		quantity: 0,
		units: null,
		name: "ingredient",
		ingredient_id: 0
	},

	initialize: function(models, options){
		this.set("user_id", App.current_user.get("id"));
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

	// validate: function(){
	// 	var name = this.get("name");
	// 	if (this.findIngredient(name)){
	// 		return true;
	// 	} 
	// 	// todo: logic
	// 	// else {
	// 		// this.ingredient = []
	// 	// }
			
	// }
});