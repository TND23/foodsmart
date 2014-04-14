App.Forms.RecipeForm = Backbone.Form.extend({
	schema: {
		model: App.Models.Recipe,
		dishname: 'Text',
		description: 'Text',
		instructions: 'Text',
		recipe_ingredients: {type: 'List', itemType: 'Text'}
	}
});