App.Views.UserIngredientsIndex = Backbone.View.extend({
	
	template: JST["user_ingredients/index"],
	events: {
		"click #submit-recipe" : "addIngredient"
	},

	addIngredient: function(e){
		e.preventDefault();
		var $name = $(".user_ingredient_name").val();
		var $quantity = $(".user_ingredient_quantity").val();
		var $units = $(".user_ingredient_units").val();
		var newUserIngredient = new App.Models.UserIngredient({name: $name, quantity: $quantity, units: $units});
		this.collection.add(newUserIngredient);
		console.log(this.collection);
//		newUserIngredient.save(newUserIngredient.attributes, {success: function(){console.log("VIC")}});
	},

	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "sync", this.refresh);
	},

	render: function(){

		var content = this.template({
			user_ingredients: App.Collections.user_ingredients
		});

		this.$el.html(content);
		return this;
	},

	refresh: function(){
		this.render();
	}
});