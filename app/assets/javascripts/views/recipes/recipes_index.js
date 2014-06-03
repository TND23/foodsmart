App.Views.RecipesIndex = Backbone.View.extend({
	template: JST["recipes/index"],
	
	events: {
		"click input-search" : "searchRecipes",
		"keyup #formInput": "searchRecipes"
	},

	initialize: function(options){
		this.collection = options.collection;
		this.listenTo(this.collection, "sync", this.refresh);
	},

	render: function(){
		var content = this.template();
		$(this.el).html(content);
		this.renderRecipes();
		this.renderPaginator();
		return this;
	},

	renderRecipes: function(){
		var $recipes = this.$("#recipes");
		// prevent undefined error
		this.listView && this.listView.remove();
		this.listView = new App.Views.RecipesList({collection: this.collection});
		var innerContent = this.listView.render();
		$recipes.html(this.listView.$el);
	},

	renderPaginator: function(){
		var $paginator = this.$("#paginator");
		this.paginatorView = new App.Views.RecipesPaginator({state: this.collection.state});
		var innerContent = this.paginatorView.render();
		$paginator.html(this.paginatorView.$el);		
	},

	searchRecipes: function(e){
		e.preventDefault();
		var dishname = $("#formInput").val();
		this.collection.searchVal = dishname;
		this.collection.getPage(1);
	}
});