accessing
leafs
	^ self hasChildrenToDisplay
		ifTrue: [ self childrenGroup flatCollect: #leafs ]
		ifFalse: [ {self} ]