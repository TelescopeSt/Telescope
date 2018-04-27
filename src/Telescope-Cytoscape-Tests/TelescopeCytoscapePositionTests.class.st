Class {
	#name : #TelescopeCytoscapePositionTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #running }
TelescopeCytoscapePositionTests >> defaultVisu [
	| butterfly |
	butterfly := TLButterfly new
		mainEntity: 2;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (10 to: 10).
	butterfly nodeCreationStrategy
		compositeProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	butterfly addCompositeDefaultCollapseInteraction.
	^ butterfly
]

{ #category : #tests }
TelescopeCytoscapePositionTests >> testSamePositionAfterFoldUnfold [
  ^'describe("#element", function() {
    it("position node", function(done) {
      node=telescope.visus[0].visu.nodes()[3];
      pos= node.position();
      actions=function(){node.trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))};
      
      // launch the second click
      telescope.onMessageEnd(
        function(){
          telescope.removeMessageEnd(this); 

          //test
          telescope.onMessageEnd(
            function(){
              expect(node.position()).to.be.deep.equal(pos);
              done();
          });
          actions();
      });

      //run the test
      actions();
    });
  });'
]
