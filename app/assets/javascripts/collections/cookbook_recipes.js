App.Collections.CookbookRecipes = Backbone.Collection.extend({

	model: App.Models.CookbookRecipe,
	url: function(){
		return "api/cookbooks/" + this.cookbook_id + "/cookbook_recipes"; 
	},
	
	initialize: function(models, options){
		this.cookbook_id = options.cookbook_id;
	}

});