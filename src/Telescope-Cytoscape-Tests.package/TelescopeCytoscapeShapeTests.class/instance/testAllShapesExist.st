tests
testAllShapesExist
	self skip.
  ^'describe("#element", function() {
    it("diamond", function() {
      expect(telescope.visus[0].visu.nodes()[0].style().shape).to.equal("diamond");
    });

    it("ellipse", function() {
      expect(telescope.visus[0].visu.nodes()[1].style().shape).to.equal("ellipse");
    });

    it("heptagon", function() {
      expect(telescope.visus[0].visu.nodes()[2].style().shape).to.equal("heptagon");
    });

    it("hexagon", function() {
      expect(telescope.visus[0].visu.nodes()[3].style().shape).to.equal("hexagon");
    });

    it("octagon", function() {
      expect(telescope.visus[0].visu.nodes()[4].style().shape).to.equal("octagon");
    });

    it("pentagon", function() {
      expect(telescope.visus[0].visu.nodes()[5].style().shape).to.equal("pentagon");
    });

    it("rectangle", function() {
      expect(telescope.visus[0].visu.nodes()[6].style().shape).to.equal("rectangle");
    });

    it("rhomboid", function() {
      expect(telescope.visus[0].visu.nodes()[7].style().shape).to.equal("rhomboid");
    });

    it("star", function() {
      expect(telescope.visus[0].visu.nodes()[8].style().shape).to.equal("star");
    });

    it("triangle", function() {
      expect(telescope.visus[0].visu.nodes()[9].style().shape).to.equal("triangle");
    });

    it("vee", function() {
      expect(telescope.visus[0].visu.nodes()[10].style().shape).to.equal("vee");
    });
  });'