Class {
	#name : #TelescopeCytoscapeGenerationTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #running }
TelescopeCytoscapeGenerationTests >> defaultVisu [
	^ TLDemos exampleLineStyle
]

{ #category : #tests }
TelescopeCytoscapeGenerationTests >> testGenerationCytoscapeObject [
	self skip.
	^ 'describe("#element", function() {
    it("Cytoscape object created", function() {
      expect(telescope.visus[0].visu).to.exist;
    });
  });'
]

{ #category : #tests }
TelescopeCytoscapeGenerationTests >> testGenerationEdgesNumber [
	self skip.
  ^'describe("#element", function() {
    it("should have 8 nodes", function() {
      expect(telescope.visus[0].visu.edges().length).to.be.equal(4);
    });
  });'
]

{ #category : #tests }
TelescopeCytoscapeGenerationTests >> testGenerationNodesNumber [
	self skip.
  ^'describe("#element", function() {
    it("should have 8 nodes", function() {
      expect(telescope.visus[0].visu.nodes().length).to.be.equal(8);
    });
  });'
]

{ #category : #tests }
TelescopeCytoscapeGenerationTests >> testGenerationVisuDiv [
	self skip.
  ^'describe("#element", function() {
    it("should have one visu on page", function() {
      expect(document.getElementsByClassName("telescopeVisu")[0]).to.exist;
    });
  });'
]
