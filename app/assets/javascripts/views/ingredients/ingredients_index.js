App.Views.IngredientsIndex = Backbone.View.extend({

	template: JST["ingredients/index"],

	initialize: function(options){
		this.collection = options.collection;
	},


	render: function(){
		this.collection.fetch();		
		var content = this.template({collection: this.collection})
		$("body").html(content);
	}
});