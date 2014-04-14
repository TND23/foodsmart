App.Views.RecipesIndex = Backbone.View.extend({
	template: JST["recipes/index"],
	
	events: {

	},

	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "sync", this.refresh);
	},

	render: function(){

		// var content = this.template({
		// 	collection: this.collection
		// });
		// this.$el.html(content);
		// return this;
		this.collection.fetch();		
		var content = this.template({collection: this.collection})
		$("body").html(content);
	},

	refresh: function(){
		console.log('refresh');
	}

});