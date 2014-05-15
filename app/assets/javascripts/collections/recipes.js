App.Collections.Recipes = Backbone.Collection.extend({
	url: "api/recipes",

	model: App.Models.Recipe,
	initialize: function(models, options){
		
	},

	getOrFetch: function(id){
		var model;
		if (this.get(id)){
			model = this.get(id);
		} else {
			model = new App.Models.Recipe({id: id});
			model.collection = this;
			model.fetch();
			return model;
		}
	}
});

App.Collections.recipes = new App.Collections.Recipes();
App.Collections.recipes.fetch();