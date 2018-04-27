Class {
	#name : #TelescopeCytoscapeShapeTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #running }
TelescopeCytoscapeShapeTests >> defaultVisu [
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet width: 40; height:40; nodeLabel: #forCytoscapeNode.
	visualization layout: TLCircularLayout.
	TLSimpleShape allSubclassesDo: [ :aSubclass | [aSubclass forCytoscapeNode. (visualization addNodeFromEntity: aSubclass) styleSheet shape: aSubclass ] on: TLNotSupportedFunctionalityException do: [  ] ].
	^ visualization
]

{ #category : #tests }
TelescopeCytoscapeShapeTests >> testAllShapesExist [
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
      expect(telescope.visus[0].visu.nodes()[4].style().shape).to.equal("polygon");
    });

    it("octagon", function() {
      expect(telescope.visus[0].visu.nodes()[5].style().shape).to.equal("octagon");
    });

    it("pentagon", function() {
      expect(telescope.visus[0].visu.nodes()[6].style().shape).to.equal("pentagon");
    });

    it("rectangle", function() {
      expect(telescope.visus[0].visu.nodes()[7].style().shape).to.equal("rectangle");
    });

    it("rhomboid", function() {
      expect(telescope.visus[0].visu.nodes()[8].style().shape).to.equal("rhomboid");
    });

    it("star", function() {
      expect(telescope.visus[0].visu.nodes()[9].style().shape).to.equal("star");
    });

    it("triangle", function() {
      expect(telescope.visus[0].visu.nodes()[10].style().shape).to.equal("triangle");
    });

    it("vee", function() {
      expect(telescope.visus[0].visu.nodes()[11].style().shape).to.equal("vee");
    });
  });'
]
