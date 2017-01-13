as yet unclassified
testCompositeContainsChildren
  ^'describe("#element", function() {
    it("ContainsChildren", function() {
      expect(telescope.visus[0].visu.nodes()[0].children()).to.have.length.above(2);
    });
  });'