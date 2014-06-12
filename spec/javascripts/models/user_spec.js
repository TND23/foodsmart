describe("App.Models.User", function(){
	var user;

	beforeEach(function(){
	  user = App.Collections.users.models[0];
	  user.user_ingredients = new App.Collections.UserIngredients([], {user: this});
		user.cookbook = new App.Models.Cookbook([], {user: this, cookbook_id: 1});
	});


	it("should have a unique username", function(){
		expect(user).toBeDefined();
		expect(user.get("username")).toEqual("george");
	});

	describe("should have a cookbook", function(){
		it("that exists", function(){
			expect(user.cookbook).toBeDefined();			
		});

		it("that has the user id", function(){
			expect(user.cookbook.get("user_id")).toEqual(1);
		});

		it("that is a backbone model", function(){
			expect(user.cookbook.get).toBeDefined();
		});

		it("that has many recipes", function(){
			console.log(user.cookbook.cookbook_recipes);
			expect(typeof(user.cookbook.cookbook_recipes)).toEqual(Object);
		});
	});

	it("should have user ingredients", function(){
		expect(user.user_ingredients.get).toBeDefined();
		expect(user_ingredient.get("name")).toEqual("ingredient");
	});


	// it("should have a cookbook", function(){
	// 	expect(user.user_ingredient.defaults).toBeDefined();
	// 	expect(user.user_ingredient.defaults.quantity).toEqual(0);
	// 	expect(user.user_ingredient.defaults.units).toEqual(null);
	// 	expect(user.user_ingredient.defaults.ingredient_id).toEqual(0);
	// });

});