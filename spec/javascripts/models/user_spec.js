describe("App.Models.User", function(){
	var user;

	beforeEach(function(){
	  user = App.Collections.users.models[0];
	  user.user_ingredients = new App.Collections.UserIngredients([], {user: user});
	});


	it("should have a unique username", function(){
		expect(user).toBeDefined();
	});

	it("should have user ingredients", function(){
		expect(user_ingredient.get).toBeDefined();
		expect(user_ingredient.get("name")).toEqual("ingredient");
	});


	it("should have a cookbook", function(){
		expect(user_ingredient.defaults).toBeDefined();
		expect(user_ingredient.defaults.quantity).toEqual(0);
		expect(user_ingredient.defaults.units).toEqual(null);
		expect(user_ingredient.defaults.ingredient_id).toEqual(0);
	});

});