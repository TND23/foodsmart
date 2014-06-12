describe('App.Collections.Recipes', function(){
	var recipes;
    	// recipe_ingredients: [{id: 1, recipe_id: 3, ingredient_id: 1, name: "Mustard", quantity: 2.0, units: "pounds", optional: false}, 
    	// {id: 2, recipe_id: 3, ingredient_id: 2, name: "Nonsense", quantity: 1.5, units: "tbsp", optional: true},
    	// {id: 3, recipe_id: 3, ingredient_id: 0, name: "DNE", quantity: 2.2, units: "farthings", optional: false}];
	beforeEach(function(){
		this.server = sinon.fakeServer.create();
		recipes = new App.Collections.Recipes();
	});

	afterEach(function(){
	});

	it('should have access to all recipes', function(){

	});

	it('should know what app is', function(){
		
	});


	describe('searching', function(){
		it ('should have search parameters', function(){
			expect(recipes.searchParams).toBeDefined()
		});

		it ('should have multiple search methods', function(){
			expect(recipes.search).toBeDefined();

			expect(recipes.searchByName).toBeDefined();
		});

		describe('locating a dish by dishname', function(){
			beforeEach(function(){
				recipe.search('Hamburger');
			});
			it('should have a list of returned values', function(){

			});

			it('should return exact matches', function(){

			});

			it('should return similar matches', function(){

			});
		});

		it('should have a search function', function(){
			expect(recipes.search).toBeDefined();
		});

	});

	it('should make a valid request', function(){
		recipes.fetch();
		expect(this.server.requests.length).toEqual(1);
	});

	it('should have many recipe models', function(){
		expect(recipes.models).toBeDefined();
	});


	it ('has an ingredients filter', function(){
		var stub = sinon.stub(this.rating);
		expect(recipe.filterByName).toBeDefined();
	});


});