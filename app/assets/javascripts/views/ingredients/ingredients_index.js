App.Views.IngredientsIndex = Backbone.View.extend({

	template: JST["ingredients/index"],

	initialize: function(options){
		this.collection = options.collection;
	},

	events: {

	},

	render: function(){
		App.Collections.ingredients.fetch();
		var content = this.template({collection: this.collection})
		$("body").html(content);
	}

});