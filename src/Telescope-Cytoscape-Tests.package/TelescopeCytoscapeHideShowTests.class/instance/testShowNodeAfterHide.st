tests
testShowNodeAfterHide
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