window.App = {
	Models: {},
	Collections: {},
	Routers: {},
	Views: {},

	initialize: function(){
		new App.Routers.AppRouter();
		Backbone.history.start();
	}
};