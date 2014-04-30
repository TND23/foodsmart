describe('App.Models.Ingredients', function(){
	var ingredient;
	beforeEach(function(){
		ingredient = new App.Models.Ingredient();
		ingredient.set("name", "Pickle");
		ingredient.set("description", "Green and cucumber-like");
	});

	it("should not have a quantity attribute", function(){
		expect(ingredient.attributes.quantity).toEqual(undefined);
	});
	

	xit('should be destructible only by administrators and creator', function(){

	});

	xit('should be creatable by anyone', function(){

	});


});