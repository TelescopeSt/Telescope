as yet unclassified
testSamePositionAfterFoldUnfold
  ^'describe("#element", function() {
    it("position node", function(done) {
      node=telescope.visus[2].visu.nodes()[3];
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