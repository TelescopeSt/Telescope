Class {
	#name : #TelescopeCytoscapeCompositeNodeTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #'as yet unclassified' }
TelescopeCytoscapeCompositeNodeTests >> defaultVisu [
	| visualization |
	visualization := TLVisualization new.
	visualization nodeCreationStrategy
		beRecursive;
		compositeProperty: #subclasses.
	visualization styleSheet
		childrenLayout: (TLLinearLayout gap: 20 maximumDimension: 300);
		nodeLabel: [ :c | c name asString ];
		width: 200;
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | 
					class subclasses isNotEmpty
						ifTrue: [ Color lightOrange alpha: 0.5 ]
						ifFalse: [ Color white ] ].
	visualization
		addNodeFromEntity: Bag;
		addCompositeDefaultCollapseInteraction.
	^ visualization
]

{ #category : #'as yet unclassified' }
TelescopeCytoscapeCompositeNodeTests >> testCompositeContainsChildren [
  ^'describe("#element", function() {
    it("ContainsChildren", function() {
      expect(telescope.visus[0].visu.nodes()[0].children()).to.have.length.above(2);
    });
  });'
]

{ #category : #'as yet unclassified' }
TelescopeCytoscapeCompositeNodeTests >> testCompositeFoldButton [
  ^'describe("#element", function() {
    it("FoldButton resize element", function() {
      nodes= telescope.visus[0].visu.nodes();
      node= nodes[0];
      height=node.height();
      width= node.width();
       
      //test
      telescope.onMessageEnd(
        function(){
          expect(height).to.be.below(node.height());
          expect(width).to.be.below(node.width());
          done();
      });
      nodes[1].trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ));
    });
  });'
]
