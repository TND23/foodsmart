App.Views.RecipesList = Backbone.View.extend({
	template: JST["recipes/_recipe_list"],
	
	events: {

	},

	initialize: function(options){
		this.collection = options.collection;
	},

	render: function(){
		var content = this.template({collection: this.collection})
		$(this.el).html(content);
		return this;
	},

});