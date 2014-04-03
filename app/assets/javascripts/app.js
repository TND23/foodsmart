window.App = {
	Models: {},
	Collections: {},
	Routers: {},
	Views: {},
	initialize: function(){
		Backbone.history.start();
		// var view = new RecipeSwap.Views.IngredientsIndex({
		// 	ingredients: RecipeSwap.Collections.Ingredients
		// });
		// RecipeSwap.Collections.Ingredients.fetch({
		// 	success: function(){
		// 		view.render();
		// 		$("body").append($el);
		// 		// $("body").append(view.render().$el);
		// 	}
		// })
	}
};