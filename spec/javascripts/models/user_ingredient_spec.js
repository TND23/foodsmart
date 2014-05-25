describe("App.Models.UserIngredient", function(){
	var user_ingredient;

	beforeEach(function(){
    var user = App.Collections.users.models[0];
    var user_ingredients = new App.Collections.UserIngredients([], {user: {id: 1}}); 
		user_ingredient = new App.Models.UserIngredient([], {user: user});

	});

	xit("should be defined", function(){
		expect(user_ingredient).toBeDefined();
	});

	xit("should have get", function(){
		expect(user_ingredient.get).toBeDefined();
		expect(user_ingredient.get("name")).toEqual("ingredient");
	});


	xit("should have proper defaults", function(){
		expect(user_ingredient.defaults).toBeDefined();
		expect(user_ingredient.defaults.quantity).toEqual(0);
		expect(user_ingredient.defaults.units).toEqual(null);
		expect(user_ingredient.defaults.ingredient_id).toEqual(0);
	});

	xit("should have a validate function", function(){
		expect(user_ingredient.validate).toBeDefined();
		user_ingredient.set("name", "Mustard");
		expect(user_ingredient.validate()).toEqual(true);
	});

});