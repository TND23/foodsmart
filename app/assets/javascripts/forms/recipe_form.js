App.Forms.RecipeForm = Backbone.Form.extend({

	schema: {
		dishname: 'Text',
		description: 'Text',
		instructions: 'Text',
		recipe_ingredients: { type: 'List', subSchema : {
			name: 'Text',
			quantity: 'Text',
			units: 'Text'
		}}
	}
});