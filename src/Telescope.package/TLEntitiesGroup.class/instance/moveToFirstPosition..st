position
moveToFirstPosition: aNode
	|    groupCopy |
	self assert: (self includes: aNode). 
	groupCopy := self telescopeEntities copy.
	self removeAll.
	self update.
	self addDrawable: aNode.
	self addAllDrawables: (groupCopy remove: aNode; yourself).
	self update