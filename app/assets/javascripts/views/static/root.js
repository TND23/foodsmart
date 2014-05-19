App.Views.Root = Backbone.View.extend({
	
	template: JST["static/root"],

	initialize: function(options){},

	render: function(){
		var content = this.template();
		this.$el.html(content);
		return this;
	}
});