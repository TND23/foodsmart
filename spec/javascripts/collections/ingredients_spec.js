describe('App.Collections.Ingredients', function(){


	it('should be defined', function(){
		expect(App.Collections.ingredients).not.toBeUndefined();
	});

	it('should have many ingredient models', function(){
		expect(App.Collections.ingredients.models).toBeDefined();
	});

	it('should have many ingredient models', function(){
		expect(App.Collections.ingredients.models.length).toEqual(2);
	});
});