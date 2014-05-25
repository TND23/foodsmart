App.Collections.Recipes = Backbone.PageableCollection.extend({
	url: "api/recipes",

	model: App.Models.Recipe,
	initialize: function(models, options){

	},

	parse: function(data){
		console.log(data);
	},

	searchFor: function(val, method){
		if (method === "byName"){
			this.searchByName(val);
		}

	},

	searchByName: function(){

	},

	searchParams: function(){
		return ["byName", "byRating", "byAuthor", "byIngredients"];
	},

	// state:{
	// 	firstPage: 1,
	// 	currentPage: 1,
	// 	totalRecords: 22
	// },

	queryParams: {
		currentPage: "current_page",
		pageSize: "page_size"
	},

	getOrFetch: function(id){
		var model;
		if (this.get(id)){
			model = this.get(id);
		} else {
			model = new App.Models.Recipe({id: id});
			model.collection = this;
			model.fetch();
			return model;
		}
	}
});

App.Collections.recipes = new App.Collections.Recipes();
App.Collections.recipes.fetch();
// The big old list of recipes