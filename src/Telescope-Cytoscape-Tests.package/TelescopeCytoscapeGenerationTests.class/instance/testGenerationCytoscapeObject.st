tests
testGenerationCytoscapeObject
	self skip.
	^ 'describe("#element", function() {
    it("Cytoscape object created", function() {
      expect(telescope.visus[0].visu).to.exist;
    });
  });'