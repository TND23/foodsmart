describe ('App.Views.RecipesIndex', function(){


	beforeEach(function(){
		this.server = sinon.fakeServer.create();
		this.view = new App.Views.RecipesIndex();
	});

	it('should have a search function', function(){

	});

	it('should default to searching by name', function(){

	});

	xit('should gracefully degrade if no similar name exists', function(){

	});

	xit('should be able to search by rating: high to low', function(){

	});

	xit('should give consistent results for rating searches', function(){

	});

	xit('should be able to search by recipe author', function(){

	});

	xit('should gracefully degrade if no author is found', function(){

	});

	xit('should be able to have more than one parameter at a time', function(){

	});

	xit('should allow for searching by recipe name and rating', function(){

	});

	xit('should allow for searching by recipe author and rating', function(){

	});

	xit('should allow for searching by recipe author and recipe name', function(){

	});

});
