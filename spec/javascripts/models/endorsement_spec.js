describe('App.Models.Endorsement', function(){
		var endorsement;
		beforeEach(function(){
			endorsement = new App.Models.Endorsement(1);
		});

		it ("should have a duplication checking function", function(){
			expect(endorsement.checkDuplication).toBeDefined();
		});

		it ("should have a duplication checking function", function(){
			expect(endorsement.weighAverages).toBeDefined();
		});
});