describe('App.Models.CookbookRecipe', function(){
	var cbrecipe;
	beforeEach(function(){
		cbrecipe = new App.Models.CookbookRecipe({recipe_id: 1, cookbook_id: 2});
	});

	it("should exist", function(){
		expect(App.Models.CookbookRecipe).toBeDefined();
	});

	it("should be referenced to by a cookbook", function(){
		expect(cbrecipe.get("recipe_id")).toEqual(1);		
	});

	it("should be referenced to by a cookbook", function(){
		
		expect(cbrecipe.get("cookbook_id")).toEqual(2);		
	});

	it("should have been authored by a user", function(){

	});

});