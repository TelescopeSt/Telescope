demos
exampleStarVisualization
	"self exampleStarVisualization"

	| visu |
	visu := TLStarVisualization new.
	visu nodeBuilder: TLNodeBuilder ellipse.
	visu nodeBuilder
		nodeHeight: [ :each | each + 100 ];
		nodeWidth: [ :each | each + 100 ].
	visu
		centerNode: 1;
		aroundNodes: [ :n | (2 to: 25) asOrderedCollection ].
	visu
		userBlock: [ :aNode | visu centerNode: aNode entity ];
		enableDefaultInteraction.
	visu open.
	^ visu