App.Views.CookbookRecipesIndex = Backbone.View.extend({

	template: JST["cookbook_recipes/index"],
	events: {
		"click .removal": "removeRecipe"
	},
	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, 'remove', this.render);
	},

	removeRecipe: function(e){
		// each id is rendered, and will be the target of a 'click'
		var id = parseInt(e.target.id);
		var model = this.collection.findWhere({cookbook_recipe_id: id});
		this.collection.remove(model);
		model.destroy();
		// persist new collection
		this.collection.sync("put", this.collection);
	},
	
	render: function(){
		var content = this.template({collection: this.collection})
		$(this.el).html(content);
		return this;
	}
});