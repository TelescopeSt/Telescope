running
testRemoveNodeInView
	| node |
	node := self testAddNodeInView.
	protocol describe once: view recv: #removeElement:; with: (connector shapeByDrawable at: node).
	node removeWith: connector.
	self assert: connector shapeByDrawable isEmpty