as yet unclassified
testDoubleClickInteraction
  ^'describe("#element", function() {
    it("click interaction", function(done) {
      node=telescope.visus[0].visu.nodes()[3];
      
      //test
      telescope.onMessageEnd(
        function(){
          expect(node.style().borderColor).to.be.deep.equal("#0707FF");
          done();
        });
        actions();
      });
      node.trigger(jQuery.Event( "mouseover", { pageX: 0, pageY: 0 } ))
    });
  });'