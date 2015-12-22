accessing
dimension
	^ self hasChildren
		ifTrue: [ self children encompassingRectangle extent + (2 * self compositeMargin) ]
		ifFalse: [ dimension ]