App.Models.CookbookRecipe = Backbone.Model.extend({
	initialize: function(options){
		this.set("cookbook_id", App.current_user.cookbook.get("id"));
		this.set("user_id", App.current_user.get("id"));
		this.set("recipe_id", options.cookbook_recipe_id);
	},

	defaults: {
		cookbook_id: 0,
		user_id: 0,
		recipe_id: 0,
		notes: null
	},

	validate: function(){
		//var cookbook = App.CollectioCookbook.find(this.cookbook_id);
		// reject if this cookbook alreayd has this recipe.
	}
});