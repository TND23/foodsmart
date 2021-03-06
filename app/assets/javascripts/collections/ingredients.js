App.Collections.Ingredients = Backbone.Collection.extend({
	url: "api/ingredients",
	model: App.Models.Ingredient,

	initialize: function(){
		// distinguish between an options user and recipe
		//this.recipe = options.recipe;
	},
	
	getOrFetch: function(id){
		var model;
		var ingredients = this;
		if (model = this.get(id)){
			return model;
		} else {
			model = new App.Models.Ingredient({id: id});
			model.fetch({
				success: function(){ App.Collections.ingredients.add(model) }
			});
			return model;
		}
	},
});

App.Collections.ingredients = new App.Collections.Ingredients();
