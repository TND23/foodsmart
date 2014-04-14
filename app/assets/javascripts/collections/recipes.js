App.Collections.Recipes = Backbone.Collection.extend({
	url: "api/recipes",

	initialize: function(models, options){

	},

	selectSearchOptions: function(options, attribute){
		
		if (options === "alphabetical"){
			this.sortAlphabetical();
		}
		if (options === "name"){
			this.searchByName(attribute)
		}
	},

});

App.Collections.recipes = new App.Collections.Recipes();