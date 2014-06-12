App.Collections.Cookbooks = Backbone.Collection.extend({
	model: App.Models.Cookbook,
	url: "/api/cookbooks"
});

