Class {
	#name : #TelescopeCytoscapeStyleAndInteractionTests,
	#superclass : #TelescopeCytoscapeTestsAbstract,
	#category : 'Telescope-Cytoscape-Tests-Client'
}

{ #category : #'as yet unclassified' }
TelescopeCytoscapeStyleAndInteractionTests >> defaultVisu [
	| visualization mousover click  rightlick |
	visualization := TLVisualization new.
	mousover := (TLStyleCustomizationAction
		custom: [ :style | 
			style
				borderColor: Color red lighter;
				color: Color red lighter ]) onMouseOver.
	click := (TLStyleCustomizationAction
		custom: [ :style | 
			style
				borderColor: Color green lighter;
				color: Color red lighter ]) onClick.
	"doubleclick := (TLStyleCustomizationAction
		custom: [ :style | 
			style
				borderColor: Color blue lighter;
				color: Color red lighter ]) onDoubleClick." "must be handle by mocha"
	rightlick := (TLStyleCustomizationAction
		custom: [ :style | 
			style
				borderColor: Color white lighter;
				color: Color red lighter ]) onRightClick.
	visualization
		addInteraction: mousover;
		addInteraction: click;
		"addInteraction: doubleclick;"
		addInteraction: rightlick.	"
	visualization layout: RTCircleLayout new."
	visualization addNodesFromEntities: ($a to: $z).	"By default connections do not inherit interactions so I have to define it"
	(visualization
		connectFollowingProperty: [ :aChar | (1 to: (0 to: 3) atRandom) collect: [ :i | (($a to: $z) \ {aChar}) atRandom ] ])
		addInteraction: mousover.
	^ visualization
]

{ #category : #'as yet unclassified' }
TelescopeCytoscapeStyleAndInteractionTests >> testClickInteraction [
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
]

{ #category : #'as yet unclassified' }
TelescopeCytoscapeStyleAndInteractionTests >> testDoubleClickInteraction [
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
]

{ #category : #'as yet unclassified' }
TelescopeCytoscapeStyleAndInteractionTests >> testHoverInteraction [
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
]
