as yet unclassified
createVisu
	| nodeBuilder |
	nodeBuilder := TLCompositeNodeBuilder new
		childrenProperty: (1 to: 10) asOrderedCollection;
		childrenLayout: (RTVerticalLineLayout withGap: 10).
	nodeBuilder childrenNodeBuilder shapeBuilder: TLEllipseShape new.
	nodeBuilder childrenNodeBuilder nodeLabel: #mooseName.
	nodeBuilder childrenNodeBuilder backgroundColor: Color yellow.
	nodeBuilder backgroundColor: Color gray.
	nodeBuilder addInteraction: TLNodeBasicInteraction popup.
	nodeBuilder addInteraction: (TLInspectAction withMenu: 'Inspect').
	nodeBuilder addInteraction: TLNodeBasicInteraction draggable.
	^ TLVisualization new nodeBuilder: nodeBuilder; buildVisualization