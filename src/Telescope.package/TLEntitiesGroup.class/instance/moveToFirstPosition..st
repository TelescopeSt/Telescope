position
moveToFirstPosition: aNode
	self assert: (self includes: aNode). 
	self telescopeEntities addFirst: (self telescopeEntities remove: aNode).
	self requireUpdateAndLayoutApplication