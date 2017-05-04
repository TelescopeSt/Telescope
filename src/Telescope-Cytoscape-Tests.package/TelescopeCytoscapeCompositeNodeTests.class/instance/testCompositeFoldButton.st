as yet unclassified
testCompositeFoldButton
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