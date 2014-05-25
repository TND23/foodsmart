App.Views.CookbookRecipesShow = Backbone.View.extend({

	template: JST["cookbook_recipes/show"],

	initialize: function(options){
		this.collection = options.collection;
	},
	
	render: function(){
		var content = this.template({collection: this.collection})
		$(this.el).html(content);
		return this;
	}
});