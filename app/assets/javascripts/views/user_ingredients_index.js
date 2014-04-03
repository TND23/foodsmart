App.Views.UserIngredientsIndex = Backbone.View.extend({
	
	template: JST["user_ingredients/index"],

	initialize: function(options){
		this.user_ingredients = options.user_ingredients;
	},

	render: function(){

		var content = this.template({
			user_ingredients: this.user_ingredients
		});

		this.$el.html(content);
		return this;
	}
});