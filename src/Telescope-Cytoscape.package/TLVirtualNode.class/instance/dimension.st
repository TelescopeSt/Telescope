accessing
dimension
	^ self hasChildren
		ifTrue: [ self children encompassingRectangle extent]
		ifFalse: [ dimension ]