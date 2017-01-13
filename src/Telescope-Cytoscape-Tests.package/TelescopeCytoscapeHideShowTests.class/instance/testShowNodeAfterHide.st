as yet unclassified
testShowNodeAfterHide
	self skip.
  ^'describe("#element", function() {
    it("show node", function(done) {
      nodes=telescope.visus[0].visu.nodes();
      actions=function(){nodes[0].trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))};
      
      // launch the second click
      telescope.onMessageEnd(
        function(){
          telescope.removeMessageEnd(this); 

          //test
          telescope.onMessageEnd(
            function(){
              expect(nodes[1].inside()).to.be.equal(true);
              done();
          });
          actions();
      });

      //run the test
      actions();
    });
  });'