describe('App.Collections.Ingredients', function(){
	beforeEach(function(){
		this.ingredients = App.Collections.ingredients;
	});

	it('should be defined', function(){
		expect(this.ingredients).not.toBeUndefined();
	});

	it('should have many ingredient models', function(){
		expect(this.ingredients.models).toBeDefined();
	});
});