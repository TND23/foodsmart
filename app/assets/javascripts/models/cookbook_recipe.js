App.Models.CookbookRecipe = Backbone.Model.extend({
	initialize: function(options){
		this.recipe_id = options.recipe_id;
		this.cookbook_id = options.cookbook_id;
	},

	validate: function(){
		//var cookbook = App.CollectioCookbook.find(this.cookbook_id);
		// reject if this cookbook alreayd has this recipe.
	}
});