as yet unclassified
testCompositeNodeInVisu
	self assert: visualization nodeBuilder class equals: TLCompositeNodeBuilder.
	self assert: visualization nodeBuilder nodeColor equals: Color gray.