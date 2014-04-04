App.Views.UserIngredientsIndex = Backbone.View.extend({
	
	template: JST["user_ingredients/index"],
	events: {

	},

	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "sync", this.refresh);
	},

	render: function(){

		var content = this.template({
			user_ingredients: this.user_ingredients
		});

		this.$el.html(content);
		return this;
	}
});