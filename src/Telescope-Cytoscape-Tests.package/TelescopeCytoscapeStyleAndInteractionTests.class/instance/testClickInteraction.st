as yet unclassified
testClickInteraction
  ^'describe("#element", function() {
    it("click interaction", function(done) {
      node=telescope.visus[0].visu.nodes()[3];
      
      //test
      telescope.onMessageEnd(
        function(){
          expect(node.style().borderColor).to.be.deep.equal("#07FF07");
          done();
        });
        actions();
      });
      node.trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ))
    });
  });'