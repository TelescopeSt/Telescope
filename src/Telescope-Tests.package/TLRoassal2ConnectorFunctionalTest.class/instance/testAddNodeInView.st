running
testAddNodeInView
	| node group |
	group := protocol mock: 'group'.
	protocol describe allow: group recv: #effectiveStyleSheet; => TLStyleSheet default.
	protocol describe once: group recv: #isNode; => false.
	protocol describe once: group recv: #allInteractions; => #().
	node := TLSimpleNode withEntity: 42.
	node parent: group.
	self assert: connector shapeByDrawable isEmpty.
	protocol describe once: view recv: #add:.
	node generateWith: connector.
	self assert: connector shapeByDrawable size equals: 1.
	^ node