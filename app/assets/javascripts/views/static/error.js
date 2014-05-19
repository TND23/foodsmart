App.Views.Error = Backbone.View.extend({
	
	template: JST["static/error"],
	
	initialize: function(options){
		this.err = options.err;
	},

	render: function(err){
		var content = this.template({error: err});
		$(this.el).html(content);
		return this;
	}
});