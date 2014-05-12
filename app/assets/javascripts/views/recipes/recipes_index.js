App.Views.RecipesIndex = Backbone.View.extend({
	template: JST["recipes/index"],
	
	events: {
		"click input#search" : "searchRecipes"
	},

	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "sync", this.refresh);
	},

	render: function(){

		this.collection.fetch();		
		var content = this.template({collection: this.collection})
		$(this.el).html(content);
		return this;
	},

	searchRecipes: function(){
		var dishname = $("#formInput").val();
		document.getElementById(dishname);
	}

});