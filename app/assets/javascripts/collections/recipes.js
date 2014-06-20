App.Collections.Recipes = Backbone.PageableCollection.extend({
	url: "api/recipes",

	model: App.Models.Recipe,
	initialize: function(models, options){

	},

	comparator: function(){

	},

	parse: function(data){
		// set state for pagination
		this.currentPage = data.current_page;
		this.state.totalRecords = data.total_entries;
		this.state.pageSize = data.per_page;
		this.state.totalPages = Math.ceil(this.state.totalRecords / this.state.pageSize);
		this.state.lastPage = this.state.totalPages;
		var data = data.models;
		return data;   
	},

	searchFor: function(val, method){
		if (method === "byName"){
			this.searchByName(val);
		}
	},


	searchVal: "",

	state:{
		pageSize: 25,
	},

	searchParams: function(){
		return ["byName", "byRating", "byAuthor", "byIngredients"];
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
	},

	getPage: function(pg){
		var pg = parseInt(pg);
		var that = this;
		this.state.currentPage = pg;
		Backbone.PageableCollection.prototype.getPage.call(this, pg, {
      data: { dishname: this.searchVal }
		}).done(function(data){
			// TODO 
		});
	}
});

App.Collections.recipes = new App.Collections.Recipes();
App.Collections.allRecipes = App.Collections.recipes.fetch(); 