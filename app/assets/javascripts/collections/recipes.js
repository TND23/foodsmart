App.Collections.Recipes = Backbone.PageableCollection.extend({
	url: "api/recipes",

	model: App.Models.Recipe,
	initialize: function(models, options){

	},

	parse: function(data){
		this.currentPage = data.current_page;
		this.totalEntries = data.total_entries;
		this.pageSize = data.per_page;
		data = data.models;
		return data;   
	},

	searchFor: function(val, method){
		if (method === "byName"){
			this.searchByName(val);
		}

	},

	searchByName: function(){

	},

	state:{
		pageSize: 10,
		sortKey: "updated",
		order: 1
	},

	searchParams: function(){
		return ["byName", "byRating", "byAuthor", "byIngredients"];
	},

	// queryParams: {
	// 	totalPages: null,
	// 	totalRecords: null,
	// 	sortKey: "sort",

	// },

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
