Class {
	#name : #TelescopeCytoscapeHideShowTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #running }
TelescopeCytoscapeHideShowTests >> defaultVisu [
	| visualization oneNode secondNode |
	visualization := TLVisualization new.
	oneNode := visualization addNodeFromEntity: 1.
	oneNode nodeLabel: 'Click on me!'.
	secondNode := visualization addNodeFromEntity: 2.
	oneNode addInteraction: (TLHideAction on: secondNode) onClick.
	^ visualization
]

{ #category : #tests }
TelescopeCytoscapeHideShowTests >> testHideNode [
  ^'describe("#element", function() {
    it("hide node", function(done) {
      nodes=telescope.visus[0].visu.nodes();
      actions=function(){nodes[0].trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))};
      
      // launch the second click
      telescope.onMessageEnd(
        function(){
          telescope.removeMessageEnd(this); 

          expect(nodes[1].inside()).to.be.equal(false);
          done();
      });

      //run the test
      actions();
    });
  });'
]

{ #category : #tests }
TelescopeCytoscapeHideShowTests >> testShowNodeAfterHide [
  ^'describe("#element", function() {
    it("show node", function(done) {
      nodes=telescope.visus[0].visu.nodes();
      tap=0;
      actions=function(){tap++;nodes[0].trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))};
      
      // launch the second click
      telescope.onMessageEnd(
        function(){
          if(tap==2){
            expect(telescope.visus[0].visu.nodes()[1].inside()).to.be.equal(true);
            done();
          }else{
//the node must be hide and remove from the graph in JS side
            expect(telescope.visus[0].visu.nodes().length).to.be.equal(1);
            actions(); // run a second click to show the node 2
          }
      });

      //run the test and hide the node 2
      actions();
    });
  });'
]
