tests
testHideNode
	self skip.
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