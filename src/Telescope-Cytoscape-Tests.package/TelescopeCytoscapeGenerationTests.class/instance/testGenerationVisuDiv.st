tests
testGenerationVisuDiv
	self skip.
  ^'describe("#element", function() {
    it("should have one visu on page", function() {
      expect(document.getElementsByClassName("telescopeVisu")[0]).to.exist;
    });
  });'