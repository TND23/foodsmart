describe('App.Models.Ingredients', function(){
	var ingredient;
	beforeEach(function(){
		ingredient = new App.Models.Ingredient();
		ingredient.set("name", "Pickle");
		ingredient.set("description", "Green and cucumber-like");
	});

	it("ingredient should be defined", function(){
		expect(ingredient).toBeDefined();
	})

	it("should not have a quantity attribute", function(){
		expect(ingredient.get("quantity")).toEqual(undefined);
		expect(ingredient.escape("quantity")).toEqual('');
	});
	
	it("should have a name and description", function(){
		expect(ingredient.get("name")).toEqual("Pickle");
	});
	
	it("should have a name and description", function(){
		expect(ingredient.get("description")).toEqual("Green and cucumber-like");
	});
});