App.Views.RecipesShow = Backbone.View.extend({
	template: JST["recipes/show"],
	
	events: {
		'click #edit-name' : 'updateName',
		'click .recipe-row' : 'addStyle',
		'keypress .recipe-row' : 'updateOnEnter',
		'blur .recipe-row' : 'removeStyle'	
	},

	addStyle: function(e){
		var el = e.currentTarget;
		$(el).addClass("editable");
	},

	close: function(e){
		var options = this.getDiv(e);
		var value = options.el.value.trim();
		var model = options.list[0];
		var el = e.currentTarget;
		$(el).removeClass("editable");
		model.set("dishname", value); 
		model.save();
	},

	getDiv: function(e){
		var target = e.target;
		var domIdVal = e.target.id;
		var list_id = parseInt(domIdVal.match(/\d+/));
		var curr_list = Lists.where({id: list_id});
		return {list: curr_list, el: target};
	},


	initialize: function(options){
		this.model = options.model[0];
		_.extend(this.model, Backbone.Events);
		this.listenTo(this.model, "all", alert("JDKFS"));
	},	

	removeStyle: function(e){
		var el = e.currentTarget;
		$(el).removeClass("editable");
	},


	render: function(){		
		var content = this.template({recipe: this.model})
		$(this.el).html(content);
		return this;
	},

	updateName: function(){
		$dishname = $("#dishname").val();
		this.model.set("dishname", $dishname);
		console.log(this.model);
		this.model.save();
	},

	updateOnEnter: function(e){
		if (e.which === ENTER_KEY){
			this.close(e);
		}
	}

});