as yet unclassified
testHoverInteraction
  ^'describe("#element", function() {
    it("click interaction", function(done) {
      node=telescope.visus[0].visu.nodes()[3];
      
      //test
      telescope.onMessageEnd(
        function(){
          expect(node.style().borderColor).to.be.deep.equal("#FF0707");
          done();
        });
        actions();
      });
      node.trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))
      node.trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))
    });
  });'