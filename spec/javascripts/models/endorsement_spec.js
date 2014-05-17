describe('App.Models.Endorsement', function(){
		var endorsement;
	beforeEach(function(){
		endorsement = new App.Models.Endorsement({user_id: 2});
		endorsement.set("stars", 5);
		endorsement.set("comments", "Hello");
		endorsement.set("recipe_id",1);
	});

	it("should be defined", function(){
		expect(endorsement).not.toBeUndefined();
	});

	it ("should belong to a user", function(){
		expect(endorsement.get("user_id")).toEqual(2);
	});

	it ("should belong to a recipe", function(){
		expect(endorsement.get("recipe_id")).toEqual(1);
	});

	it ("should have comments", function(){
		expect(endorsement.get("comments")).toEqual("Hello");
	});

	it("should have a rating in stars", function(){
		expect(endorsement.get("stars")).toEqual(5);			
	});

	it ("should not be able to belong to the recipes owner", function(){
			
	});

});