as yet unclassified
testCompositeFoldButton
  ^'describe("#element", function() {
    it("FoldButton resize element", function() {
      node= telescope.visus[0].visu.nodes()[0];
      width=node.autoWidth;
      height=node.autoHeight;
       
      //test
      telescope.onMessageEnd(
        function(){
          expect(width).to.be.above(node.autoWidth);
          expect(height).to.be.above(node.autoHeight);
          done();
      });
      nodes[1].trigger(jQuery.Event( "tap", { pageX: 0, pageY: 0 } ));
    });
  });'