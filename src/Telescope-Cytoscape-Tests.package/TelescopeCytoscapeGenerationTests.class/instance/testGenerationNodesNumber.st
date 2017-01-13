tests
testGenerationNodesNumber
	self skip.
  ^'describe("#element", function() {
    it("should have 8 nodes", function() {
      expect(telescope.visus[0].visu.nodes().length).to.be.equal(8);
    });
  });'