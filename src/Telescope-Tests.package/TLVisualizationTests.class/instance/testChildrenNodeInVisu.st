as yet unclassified
testChildrenNodeInVisu
	self assert: visualization nodeBuilder childrenNodeBuilder nodeColor equals: Color yellow.
	self assert: (visualization nodeBuilder childrenNodeBuilder shapeBuilder isKindOf: TLCompositeLabelShape).
	self assert: (visualization nodeBuilder childrenNodeBuilder shapeBuilder shape isKindOf: TLEllipseShape).